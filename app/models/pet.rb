class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  

  validates :pet_name, :title, :description, :price, :category, :species, :location, presence: true
  validates :title, length: { minimum: 10, too_short: `is too short (minimum is %{count} characters)` }
end
