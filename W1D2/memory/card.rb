class Card
  attr_reader :value
  attr_accessor :status

  def initialize(value, status = false)
    @value = value
    @status = status

  end

  def hide
    @status = false
  end

  def reveal
    @status = true
  end

  def to_s
  end

  def ==(card)
    value == card.value
  end
end
