# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


# include ActionView::Helpers::DateHelper

class Cat < ApplicationRecord

  COLORS = %w(yellow black white calico).freeze
  validates :birth_date, :name, :description, :color, :sex, presence: true
  validates :name, uniqueness: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w(M F) }



  has_many :cat_rental_requests,
    foreign_key: :cat_id,
    dependent: :destroy





  def age(birth_date)
    now = Time.now.utc.to_date

    # https://stackoverflow.com/questions/819263/get-persons-age-in-ruby
    yr_offset = if now.month > birth_date.month
        0
      elsif now.month == birth_date.month && now.day >= birth_date.day
        0
      else
        1
      end

    now.year - birth_date.year - yr_offset
  end



end
