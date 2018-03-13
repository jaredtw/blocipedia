# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld',
    confirmed_at: Time.now
  )
end
users = User.all

50.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::Superhero.name,
    body: Faker::Superhero.power,
    private: false
  )
end

wikis = Wiki.all

admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'admin'
)

premium = User.create!(
  name: 'Premium User',
  email: 'premium@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'premium'
)

standard = User.create!(
  name: 'Standard User',
  email: 'standard@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'standard'
)
