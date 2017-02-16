# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password'
  )
  user.save!
end

tyler = User.create!(
  email: 'tyler@test.com',
  password: 'password'
)
tyler.save!

users = User.all
puts "#{User.count} users created"

5.times do
  podcast = Podcast.create!(
    title: Faker::Book.title,
    link:  Faker::Internet.url,
    user: tyler,
    days: days.sample
  )
  podcast.save!
end
podcasts = Podcast.all

puts "#{Podcast.count} podcasts created"
puts "Seed finished"
