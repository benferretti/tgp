require 'faker'

City.destroy_all
Gossip.destroy_all
Tag.destroy_all
GossipsTag.destroy_all
User.destroy_all
PrivateMessage.destroy_all

cities = Array.new
gossips = Array.new
tags = Array.new
users = Array.new
private_messages = Array.new


10.times do 
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
  cities << city
  puts "Seeding City #{city.name} #{city.zip_code}"
end

10.times do 
  user = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  description: Faker::Lorem.sentence,
  age: rand(18..99),
  city_id: cities[rand(0..9)].id
  )
  users << user
  puts "Seeding User #{user.first_name} #{user.last_name}"
end

10.times do 
  tag = Tag.create(title: "#" + Faker::Verb.base)
  tags << tag
  puts "Seeding #{tag.title}"
end

20.times do 
  gossip = Gossip.create(title: Faker::DcComics.title,
  content: Faker::ChuckNorris.fact,
  user_id: users[rand(0..9)].id)
  gossips << gossip
  puts "Seeding Gossip #{gossip.title} :  #{gossip.content}"
end

15.times do
  gossiptag = GossipsTag.create(
  gossip_id: gossips[rand(0..19)].id,
  tag_id: tags[rand(0..9)].id)
  puts "Seeding Gossip #{gossiptag.gossip_id} to Tag #{gossiptag.tag_id}"
end

10.times do
  private_message = PrivateMessage.create(
  recipient_id: users[rand(0..9)].id,
  sender_id: users[rand(0..9)].id,
  content: Faker::GreekPhilosophers.quote
  )
  puts "Seeding PM '#{private_message.content}' from User #{private_message.sender_id} to User #{private_message.recipient_id}"
end




