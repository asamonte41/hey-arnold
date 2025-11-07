# db/seeds.rb

puts "Clearing old data..."

# Destroy all records in the correct order to avoid foreign key issues
Appearance.destroy_all
Episode.destroy_all
Character.destroy_all
Location.destroy_all

puts "Creating locations..."
locations = [
  { name: "Hillwood", description: "The city where Arnold and friends live" },
  { name: "P.S. 118", description: "Arnold's school" },
  { name: "The Park", description: "Local hangout spot" }
]

locations.each do |loc|
  Location.create!(loc)
end

puts "Creating characters..."
characters = [
  { name: "Arnold", role: "Protagonist", description: "The main character", image_url: "https://example.com/arnold.png", location: Location.find_by(name: "Hillwood") },
  { name: "Gerald", role: "Best Friend", description: "Arnold's best friend", image_url: "https://example.com/gerald.png", location: Location.find_by(name: "Hillwood") },
  { name: "Helga", role: "Antagonist / Secret admirer", description: "Helga bullies Arnold but secretly loves him", image_url: "https://example.com/helga.png", location: Location.find_by(name: "Hillwood") }
]

characters.each do |char|
  Character.create!(char)
end

puts "Creating episodes..."
episodes_data = [
  { title: "Downtown as Fruits", season: 1, episode_number: 1, air_date: '1996-10-07' },
  { title: "The Journal", season: 1, episode_number: 2, air_date: '1996-10-14' },
  { title: "Ghost Bride", season: 2, episode_number: 1, air_date: '1997-03-01' }
]

episodes_data.each do |ep|
  Episode.create!(
    title: ep[:title],
    season: ep[:season],
    episode_number: ep[:episode_number],
    air_date: ep[:air_date],
    synopsis: Faker::Lorem.sentence(word_count: 12)
  )
end

puts "Creating appearances..."
# Link characters to episodes randomly
Episode.all.each do |ep|
  Character.all.sample(rand(1..Character.count)).each do |char|
    Appearance.create!(character: char, episode: ep)
  end
end

puts "Seeding complete!"
