# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Treehouse.destroy_all
User.destroy_all

users = []
10.times  do
  users << User.create(email: Faker::Internet.email, password: "123456")
end

users.each do |user|
  Treehouse.create(title: Faker::Simpsons.location, description: Faker::TheFreshPrinceOfBelAir.quote, location: Faker::Address.city, price_per_night: 30, capacity: [2, 4, 6].sample, user: user)
end

puts 'Seeds finished!'
