class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :date, presence: true
  validates :message, presence: true
  validates :message, length: { minimum: 6, too_short: `is too short (minimum is %{count} characters)` }
  validates_uniqueness_of :pet_id, :scope => [:date]
end
