require 'faker'
require 'unsplash'

# Configure Unsplash (ensure this is set up as per your initializer file)
Unsplash.configure do |config|
  config.application_access_key = ENV['UNSPLASH_ACCESS_KEY']
  config.application_secret = ENV['UNSPLASH_SECRET_KEY']
  config.application_redirect_uri = ENV['UNSPLASH_REDIRECT_URI']
  config.utm_source = ENV['UNSPLASH_UTM_SOURCE']
end

Cloud.delete_all
puts "All existing cloud records have been deleted."

# Ensure there's at least one user in the database or adjust this logic as necessary
user = User.first

unless user
  puts "No users found. Please create a user first."
  exit
end

# Number of records you want to create
number_of_records = 5

descriptions = Array.new(10) do
  "Experience #{Faker::Address.community} with our cloud. Enjoy #{['stunning sunsets', 'gorgeous skyline views', 'peaceful mornings', 'starlit nights'].sample} from your private formation. This cloud features #{['luxury bedding', 'an eco-friendly atmosphere', 'spacious lounging areas', 'breathtaking panoramic views'].sample} and #{['modern amenities', 'personalized experiences', 'exclusive access to celestial events', 'the best in cloud comfort'].sample}. Ideal for those seeking a unique and serene getaway."
end

number_of_records.times do
  name = Faker::Science.element # Using science elements to give a unique twist
  category = "Clouds"  # Fixed category for all records
  description = descriptions.sample
  address = Faker::Address.full_address


  # Fetch a random picture URL from Unsplash specifically related to "clouds"
  picture_response = Unsplash::Photo.random(query: "clouds")
  picture_url = picture_response.urls.small

  # Create a new Cloud record associated with the first user
  Cloud.create!(
    name: name,
    category: category,
    description: description,
    address: address,
    picture_url: picture_url,
    user: user  # Associate with the user fetched above
  )
end

puts "#{number_of_records} cloud records have been created and associated with User ##{user.id}."
