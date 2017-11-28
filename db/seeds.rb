require 'faker'

# Journey.destroy_all
# Treehouse.destroy_all
# User.destroy_all

# users = []

# lionel = User.create(email: 'lionel@mail.com', password: "123456")
# amelie = User.create(email: 'amelie@mail.com', password: "123456")
# anthony = User.create(email: 'anthony@mail.com', password: "123456")
# amael = User.create(email: 'amael@mail.com', password: "123456")

# [lionel, amelie, anthony, amael].each { |member| users << member }

# 30.times  do
#   users << User.create(email: Faker::Internet.email, password: "123456")
# end

# location = ["Paris", "Bordeaux", "Lyon", "Charenton", "Annecy", "Antibes"]

# users.each do |user|
#   Treehouse.create(title: Faker::Simpsons.location, description: Faker::TheFreshPrinceOfBelAir.quote, location: location.sample, price_per_night: 30, capacity: [2, 4].sample, user: user)
#   Treehouse.create(title: Faker::Simpsons.location, description: Faker::TheFreshPrinceOfBelAir.quote, location: location.sample, price_per_night: 30, capacity: [2, 4].sample, user: user)
# end

# puts 'Seeds finished!'


journey1 = Journey.create(checkin: '17/12/2017', checkout: '23/12/2017', guests_number: 4, is_confirmed: false, user_id: 130, treehouse_id: 303)
journey2 = Journey.create(checkin: '25/12/2017', checkout: '08/01/2018', guests_number: 3, is_confirmed: true, user_id: 131, treehouse_id: 304)
