require 'faker'
require 'unsplash'

# Configure Unsplash
Unsplash.configure do |config|
  config.application_access_key = ENV['UNSPLASH_ACCESS_KEY']
  config.application_secret = ENV['UNSPLASH_SECRET_KEY']
  config.application_redirect_uri = ENV['UNSPLASH_REDIRECT_URI']
  config.utm_source = ENV['UNSPLASH_UTM_SOURCE']
end

Cloud.delete_all
User.delete_all
puts "All existing cloud and user records have been deleted."

# Create users
number_of_users = 5

number_of_users.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'password', # Provide a default password
    password_confirmation: 'password' # Confirm the password
  )
  user.save!
end

puts "#{number_of_users} users have been successfully created."

# Check if at least one user exists
user = User.first

unless user
  puts "No users found. Please create a user first."
  exit
end

# Create cloud records
number_of_records = 7

descriptions = Array.new(10) do
  "Experience #{Faker::Address.community} with our cloud. Enjoy #{['stunning sunsets', 'gorgeous skyline views', 'peaceful mornings', 'starlit nights'].sample} from your private formation. This cloud features #{['luxury bedding', 'an eco-friendly atmosphere', 'spacious lounging areas', 'breathtaking panoramic views'].sample} and #{['modern amenities', 'personalized experiences', 'exclusive access to celestial events', 'the best in cloud comfort'].sample}. Ideal for those seeking a unique and serene getaway."
end

# Custom method to generate whimsical cloud addresses
def generate_cloud_address
  "Cloud No. #{Faker::Number.number(digits: 3)}, #{Faker::Address.city} Skies, In the vicinity of #{Faker::Space.constellation} Constellation"
end


number_of_records.times do
  name = Faker::Science.element
  category = "Clouds"
  description = descriptions.sample
  address = generate_cloud_address

  # Custom method to generate latitude and longitude over land
  def generate_land_coordinates
    # Define ranges for latitudes and longitudes over large landmasses
    lat_ranges = [[-34.0, -23.0], [30.0, 45.0]] # Example ranges for South America and Europe
    lng_ranges = [[-74.0, -58.0], [10.0, 25.0]] # Corresponding longitude ranges

    lat_range = lat_ranges.sample
    lng_range = lng_ranges.sample

    latitude = Faker::Number.between(from: lat_range[0], to: lat_range[1])
    longitude = Faker::Number.between(from: lng_range[0], to: lng_range[1])

    [latitude, longitude]
  end

  latitude, longitude = generate_land_coordinates

  available_from = Faker::Date.forward(days: 23) # Start date within the next 23 days
  available_until = available_from + rand(1..10) # End date is between 1 to 10 days after the start date

  # Fetch a random picture URL from Unsplash
  picture_response = Unsplash::Photo.random(query: "clouds")
  picture_url = picture_response.urls.small

  Cloud.create!(
    name: name,
    category: category,
    description: description,
    address: address,
    picture_url: picture_url,
    user: user,
    available_from: available_from,
    available_until: available_until,
    latitude: latitude,
    longitude: longitude
  )
end

puts "#{number_of_records} cloud records have been created and associated with User ##{user.id}."
