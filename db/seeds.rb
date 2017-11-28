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

lionel = User.create(email: 'lionel@mail.com', password: "123456")
amelie = User.create(email: 'amelie@mail.com', password: "123456")
anthony = User.create(email: 'anthony@mail.com', password: "123456")
amael = User.create(email: 'amael@mail.com', password: "123456")

[lionel, amelie, anthony, amael].each { |member| users << member }

30.times  do
  users << User.create(email: Faker::Internet.email, password: "123456")
end

location = ["Paris", "Bordeaux", "Lyon", "Charenton", "Annecy", "Antibes"]

users.each do |user|
  Treehouse.create(title: Faker::Simpsons.location, description: Faker::TheFreshPrinceOfBelAir.quote, location: location.sample, price_per_night: 30, capacity: [2, 4].sample, user: user)
  Treehouse.create(title: Faker::Simpsons.location, description: Faker::TheFreshPrinceOfBelAir.quote, location: location.sample, price_per_night: 30, capacity: [2, 4].sample, user: user)
end

puts 'Seeds finished!'
