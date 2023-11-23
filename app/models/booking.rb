class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  STATUS = ["pending", "accepted", "rejected"]
  validates :date, presence: true
  validates :message, presence: true
  validates :message, length: { minimum: 6 }
  validates_uniqueness_of :pet_id, :scope => [:date]
  validates :status, inclusion: { in: STATUS }
end
