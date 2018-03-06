# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5 times do
  User.create!(Faker::Name.name)
end
users = User.all

20 times do
  Wiki.create!(
    user:  users.sample
    title: Faker::String.random(5..20)
    body:  Faker::String.random(50..200)
  )
end
wikis = Wiki.all
