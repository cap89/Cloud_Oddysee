# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require "faker"


funny_cloud_names = [
  "Fluffy McFluffface",
  "Cumulus Giganticus",
  "StratoNimbus Rex",
  "Misty Overlook",
  "Vaporwave Heights",
  "Sky Fluff Unlimited",
  "Breezy McCloud",
  "Floating Cotton Castle",
  "Aeriforme Aficionado",
  "Cloud Nine Dreams"
]

funny_cloud_types = [
  "Whimsical Wanderer",
  "Mystical Mirage",
  "Breezy Behemoth",
  "Celestial Cruiser",
  "Nebulous Navigator"
]

puts "Clearing all data"
# User.delete_all
Cloud.delete_all
# Booking.delete_all

puts "Database cleared sucesssfully"

funny_cloud_names.each do |name|
  Cloud.create!(
    name: name,
    type: funny_cloud_names.sample,
    description: Faker::Lorem.sentence(word_count: 5), # Using Faker for the description
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    available_from: Faker::Date.between(from: Date.today, to: Date.today + 30),
    available_until: Faker::Date.between(from: Date.today + 31, to: Date.today + 60)
  )
  puts "Seeding completed: Created #{funny_cloud_names.length} clouds with funny names and types."

end
