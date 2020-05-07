# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
10.times do
  city = City.create(
    name: Faker::Nation.capital_city,
    zip_code: Faker::Address.zip_code
  )
end

User.destroy_all
10.times do
  user = User.create(
    username: Faker::Name.first_name,
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    description: Faker::Hipster.sentence, 
    email: Faker::Internet.email,
    age: rand(16..88),
    city: City.all.sample,
    password: Faker::Lorem.characters(number: 10)
    )
end

Gossip.destroy_all
20.times do
  gossip = Gossip.create(
    title: Faker::Name.first_name, 
    content: Faker::Movies::HarryPotter.quote,
    user: User.all.sample
    )
end

Tag.destroy_all
10.times do
    tag = Tag.create(
      title: Faker::App.name
    )
end 

GossipTag.destroy_all
30.times do
    gossip_tag = GossipTag.create(
      gossip: Gossip.all.sample,
      tag: Tag.all.sample
    )
end

PrivateMessage.destroy_all
10.times do
    private = PrivateMessage.new
    private.sender = User.all.sample
    private.recipient = User.all.sample
    private.content = Faker::ChuckNorris.fact
    private.save
end