# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Pet.destroy_all

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
  category: "Party",
  species: "Pony",
  location: "Augsburg",
  user_id: users[2].id,
  image: "https://plus.unsplash.com/premium_photo-1681882142855-66005be79600?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
},
{
  pet_name: "Tranquil Tardigrade",
  title: "Sloth for a slow day",
  description: "Experience the ultimate relaxation with Tranquil Tardigrade, your 'Sloth for a Slow Day.' Let this easygoing companion turn your hectic day into a leisurely escape, bringing a sense of calm and joy with its unhurried charm.",
  price: 300,
  category: "Relax",
  species: "Sloth",
  location: "Hamburg",
  user_id: users[1].id,
  image: "https://cdn.pixabay.com/photo/2016/12/03/15/11/sloth-1879999_1280.jpg"
},
{
  pet_name: "Sensei Shellshock",
  title: "Rent a Ninja Turtle for Martial Arts Lessons",
  description: "Unlock your inner ninja with Sensei Shellshock! Rent this skilled Ninja Turtle for personalized martial arts lessons, blending discipline and fun to transform your training into a shell-shocking adventure.",
  price: 500,
  category: "Sports",
  species: "Turtle",
  location: "Berlin",
  user_id: users[0].id,
  image: "https://images.unsplash.com/photo-1633606849129-4ead6b0fd70f?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
},
{
  pet_name: "Kurt Koala",
  title: "Chill on your couch with Kurt",
  description: "Time to watch your favorite movie on a cloudy Sunday afternoon! Kurt the Koala is your best companion to do that.",
  price: 220,
  category: "Relax",
  species: "Koala",
  location: "Cologne",
  user_id: users[1].id,
  image: "https://cdn.pixabay.com/photo/2020/07/21/12/55/koala-5426177_1280.jpg"
},
])
