require "faker"
require "httparty"

puts "Clearing old data..."
Appearance.destroy_all
Character.destroy_all
Episode.destroy_all
Location.destroy_all

# Locations
puts "Creating locations..."
hillwood = Location.create!(name: "Hillwood", description: "Arnold's home neighborhood.")
school   = Location.create!(name: "P.S. 118", description: "Hey Arnold school building.")

# --- 1️⃣  Fetch real characters from Hey Arnold API ---
puts "Fetching characters from API..."
begin
  res = HTTParty.get("https://hey-arnold-api.herokuapp.com/api/v1/characters")
  if res.success?
    res.parsed_response.each do |char|
      Character.create!(
        name: char["name"] || char["characterName"],
        role: char["nickname"] || "Unknown",
        description: char["description"] || "Character from Hey Arnold!",
        image_url: char["image"] || char["imageUrl"],
        location: [hillwood, school].sample
      )
    end
  else
    puts "API error #{res.code}"
  end
rescue => e
  puts "Could not reach API: #{e.message}"
end

# --- 2️⃣  Faker-generated data ---
puts "Adding Faker characters..."
50.times do
  Character.create!(
    name: Faker::TvShows::HeyArnold.character,
    role: Faker::TvShows::HeyArnold.quote[0..20],
    description: Faker::TvShows::HeyArnold.quote,
    image_url: "https://placekitten.com/200/300",
    location: [hillwood, school].sample
  )
end

# Episodes
puts "Creating episodes..."
100.times do |i|
  Episode.create!(
    title: Faker::TvShows::HeyArnold.episode || "Episode #{i}",
    season: rand(1..5),
    episode_number: rand(1..20),
    air_date: Faker::Date.between(from: "1996-01-01", to: "2005-01-01"),
    synopsis: Faker::TvShows::HeyArnold.quote
  )
end

# Appearances (join records)
puts "Linking characters and episodes..."
characters = Character.all
episodes = Episode.all
characters.each do |c|
  episodes.sample(rand(1..3)).each do |e|
    Appearance.create!(character: c, episode: e)
  end
end

puts "✅ Seeded #{Character.count} characters, #{Episode.count} episodes, #{Location.count} locations, #{Appearance.count} appearances."
