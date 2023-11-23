class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  CATEGORY = ["Transport", "Cuddle", "Therapy", "Adventure", "Party", "Relax", "Sports"]
  validates :pet_name, :title, :description, :price, :category, :species, :location, presence: true
  validates :title, length: { minimum: 10 }
  validates :category, inclusion: { in: CATEGORY }
end
