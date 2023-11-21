class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :date, presence: true
  validates :message, presence: true
  validates :message, length: { minimum: 15 }
end
