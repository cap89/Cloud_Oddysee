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

cloud_pictures = [
  "https://i.imgur.com/fQLL8nr.jpeg",
  "https://i.imgur.com/1Gv2XLR.png",
  "https://i.imgur.com/WgXBQjD.jpeg",
  "https://i.imgur.com/zwnXdOY.jpeg",
  "https://blogs.smithsonianmag.com/smartnews/files/2013/05/170500174_d15d6c5541_z.jpg",
  "https://pics.craiyon.com/2023-11-28/RAAwYeGbRr6m66oxWFCPyw.webp",
  "https://img.freepik.com/free-vector/flat-clouds-collection_23-2149027404.jpg",
  "https://c8.alamy.com/comp/2C4FHK1/blue-cute-cloud-illustration-vector-on-white-background-2C4FHK1.jpg",
  "https://img.freepik.com/premium-photo/cute-cloud-cartoon_1000644-573.jpg",
  "https://cdn1.vectorstock.com/i/1000x1000/69/05/cute-cloud-cartoon-vector-22566905.jpg",
  "https://as1.ftcdn.net/v2/jpg/04/91/38/02/1000_F_491380252_zFZ6tOIfFBf3e6HAHm8MguVr6sKsODb0.jpg",
  "https://as1.ftcdn.net/v2/jpg/04/42/56/96/1000_F_442569678_flZ0pjTG9Nu2nQFYj2SFbb44XeVdIvev.jpg",
  "https://previews.123rf.com/images/oixxo/oixxo1901/oixxo190100810/115441007-valentines-day-cute-cat-on-a-cloud-with-heart-on-a-string-cartoon-image.jpg"
]

puts "Clearing all data"
Cloud.delete_all
User.delete_all
# Booking.delete_all


puts "Database cleared sucesssfully"

user_1 = User.create!(
  first_name:"Vio",
  last_name: "SommerCloud",
  email: "vio@vio.com",
  password: "Cloud9"
)

user_count = User.count
puts "Created #{user_count} user(s)."


funny_cloud_names.each do |name|
  Cloud.create!(
    name: name,
    category: funny_cloud_names.sample,
    description: Faker::Lorem.sentence(word_count: 5), # Using Faker for the description
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    available_from: Faker::Date.between(from: Date.today, to: Date.today + 30),
    available_until: Faker::Date.between(from: Date.today + 31, to: Date.today + 60),
    picture_url: cloud_pictures.sample,
    user: user_1
  )

end

puts "Seeding completed: Created #{funny_cloud_names.length} clouds with funny names and types."
