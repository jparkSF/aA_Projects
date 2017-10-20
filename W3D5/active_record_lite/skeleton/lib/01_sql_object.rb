require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    columns = DBConnection.execute2(<<-SQL)
    SELECT
    *
    FROM
    #{self.table_name}
    SQL

    @columns = columns.first.map(&:to_sym)
  end

  def self.finalize!

    self.columns.each do |column|
      define_method(column) do
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self.to_s.tableize}"
  end

  def self.all
    res = DBConnection.execute2(<<-SQL)
    SELECT
    *
    FROM
    #{table_name}
    SQL

    self.parse_all(res.drop(1))

  end

  def self.parse_all(results)

    results.map{|result| self.new(result)}


  end

  def self.find(id)
    self.all.find { |obj| obj.id == id }
  end

  def initialize(params = {})
    params.each do |k,v|
      k = k.to_sym
      if self.class.columns.include?(k)
        self.send("#{k}=", v)
      else
        raise "unknown attribute 'favorite_band'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
      #{self.class.table_name} (#{col_names})
      VALUES
      (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    set = self.class.columns.map{|attr| "#{attr} = ? "}.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE #{self.class.table_name}
      SET #{set}
      WHERE id = ?
    SQL
  end

  def save
    id.nil? ? insert : update
  end
end
