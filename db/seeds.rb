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

location = ["Paris", "Bordeaux", "Lyon", "Charenton", "Annecy", "Antibes", "Lille"]

users.each do |user|
  Treehouse.create(title: Faker::Overwatch.location, description: Faker::GameOfThrones.house, location: location.sample, price_per_night: 30, capacity: [2, 4].sample, user: user)
  Treehouse.create(title: Faker::Overwatch.location, description: Faker::GameOfThrones.house, location: location.sample, price_per_night: 30, capacity: [2, 4].sample, user: user)
end

puts 'Seeds finished!'
