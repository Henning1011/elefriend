class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :title, :description, :price, :category, :species, :location, presence: true
  validates :title, length: { minimum: 10 }
end
