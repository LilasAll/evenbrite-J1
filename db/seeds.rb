# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def random_city
	city_list = Array.new
	city_list = ["New-York", "Paris", "Londre", "Lille", "Tourcoing", "Roubaix", "Tokyo", "Madrid", "Hawaï"].shuffle
	@city = city_list.first
	return @city
end

#User.destroy_all
#Event.destroy_all
#Attendance.destroy_all

50.times do 
	User.create!(email: "user#{rand(1..100)}@yopmail.com",encrypted_password: Faker::Creature::Animal.name,description: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false),first_name: Faker::Name.first_name,last_name: Faker::Name.last_name)
end

10.times do
	Event.create!(start_date: Faker::Date.forward(days: 250),duration: rand(1..10)*5,title: Faker::Lorem.paragraph_by_chars(number: 30, supplemental: false),description: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false),price: Faker::Number.between(from: 2, to: 999),location: random_city,admin: User.all.sample)
end

60.times do
	Attendance.create!(user_id: User.all.sample.id,event_id: Event.all.sample.id,stripe_customer_id: Faker::Alphanumeric.alpha(number: 6))
end

