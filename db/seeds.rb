# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Pet.destroy_all
User.destroy_all

users = User.create!([{
  email: "kaitlyn.johnson@email.com",
  password: "123456"
},
{
  email: "liam.rodriguez@email.com",
  password: "123456"
},
{
  email: "maya.patel@email.com",
  password: "123456"
},
])
Pet.create!([{
  pet_name: "Starlight Sparkle",
  title: "Pony for Parties",
  description: "Meet Starlight Sparkle, the enchanting Pony for Parties! Add a touch of magic to your celebrations with gentle pony rides and whimsical moments that create unforgettable memories.",
  price: 200,
  category: "Experience",
  species: "Pony",
  location: "Augsburg",
  user_id: users[2].id
},
{
  pet_name: "Tranquil Tardigrade",
  title: "Sloth for a slow day",
  description: "Experience the ultimate relaxation with Tranquil Tardigrade, your 'Sloth for a Slow Day.' Let this easygoing companion turn your hectic day into a leisurely escape, bringing a sense of calm and joy with its unhurried charm.",
  price: 300,
  category: "Experience",
  species: "Sloth",
  location: "Hamburg",
  user_id: users[1].id
},
{
  pet_name: "Sensei Shellshock",
  title: "Rent a Ninja Turtle for Martial Arts Lessons",
  description: "Unlock your inner ninja with Sensei Shellshock! Rent this skilled Ninja Turtle for personalized martial arts lessons, blending discipline and fun to transform your training into a shell-shocking adventure.",
  price: 500,
  category: "Experience",
  species: "Turtle",
  location: "Berlim",
  user_id: users[0].id
},
])
