# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = '123456'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['address1'] = Faker::Address.street_address
    listing['postalcode'] = Faker::Address.zip_code
    listing['state'] = Faker::Address.state
    listing['country'] = 'Malaysia'
    listing['no_bed'] = rand(1..10)
    listing['no_room'] = rand(0..5)
    listing['max_guest'] = rand(1..10)
    listing['price_per_day'] = rand(80..500)
    listing['currency'] = 'MYR'
    listing['content'] = Faker::Hipster.sentence
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['name'] = Faker::App.name
    listing['smoker'] = rand(0..1)
    listing['pets'] = rand(0..1)
    listing['instant_book'] = rand(0..1)

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end