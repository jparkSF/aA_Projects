# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  STATUS = %w(APPROVED DENIED PENDING).freeze
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUS }
  validate :overlapping_approved_requests

  belongs_to :cat

  def overlapping_approved_requests
    if overlapping_requests.where(status: 'APPROVED').count > 0
      errors.add('Dates overlapping. Pick another date.')
    end

  end

  def overlapping_requests
    #request1
    CatRentalRequest.where(cat_id: self.cat_id)
      .where(start_date: self.start_date..self.end_date)
      .or
        (CatRentalRequest.where(cat_id: self.cat_id)
        .where(end_date: self.start_date..self.end_date))

  end


end
