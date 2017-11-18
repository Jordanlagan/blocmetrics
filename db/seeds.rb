require 'faker'

3.times do |u|
  User.create!( email: "test"+u.to_s+"@example.com", password: "helloworld", confirmed_at: Time.now )
end
users = User.all

puts "Users seeded"

15.times do
  RegisteredApplication.create!( user: users.sample, name: Faker::Internet.domain_word, url: Faker::Internet.url )
end
apps = RegisteredApplication.all

puts "Apps seeded"

events = ["visit", "leave", "click-link"]

50.times do
  Event.create!( registered_application: apps.sample, name: events.sample )
end

puts "Events seeded"
