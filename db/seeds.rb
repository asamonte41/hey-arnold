# db/seeds.rb

puts "Seeding data..."

# Clear old data first
Quote.destroy_all
Episode.destroy_all
Character.destroy_all
Location.destroy_all

# --- Locations ---
school = Location.create!(name: "P.S. 118", description: "The elementary school where Arnold and his friends study.")
neighborhood = Location.create!(name: "Hillwood", description: "The neighborhood where the main characters live.")
boarding_house = Location.create!(name: "Sunset Arms Boarding House", description: "Arnold's home, run by his grandparents.")

# --- Characters ---
characters = [
  { name: "Arnold Shortman", role: "Main Character", description: "An optimistic and kind fourth grader with a unique football-shaped head.", image_url: "arnold.png", location_id: boarding_house.id },
  { name: "Helga Pataki", role: "Arnold’s classmate and secret admirer", description: "Smart, tough, and sarcastic, but secretly in love with Arnold.", image_url: "helga.jpg", location_id: school.id },
  { name: "Gerald Johanssen", role: "Arnold’s best friend", description: "Cool, loyal, and smooth-talking. Known for his tall hair and great storytelling.", image_url: "gerald.jpg", location_id: neighborhood.id },
  { name: "Phoebe Heyerdahl", role: "Helga’s best friend", description: "Sweet, intelligent, and often the voice of reason for Helga.", image_url: "phoebe.jpg", location_id: school.id },
  { name: "Harold Berman", role: "Class bully", description: "Tough on the outside, but has a sensitive side.", image_url: "harold.jpg", location_id: school.id },
  { name: "Rhonda Wellington Lloyd", role: "Fashionable classmate", description: "Rich, stylish, and sometimes self-centered, but loyal to her friends.", image_url: "rhonda.jpg", location_id: school.id },
  { name: "Sid", role: "Arnold’s friend", description: "Superstitious and anxious, but means well.", image_url: "sid.jpg", location_id: neighborhood.id },
  { name: "Stinky Peterson", role: "Arnold’s friend", description: "Tall, slow-talking, and honest. Has a surprisingly kind heart.", image_url: "stinky.jpg", location_id: neighborhood.id },
  { name: "Grandpa Phil", role: "Arnold’s grandfather", description: "Funny, wise, and a bit eccentric.", image_url: "grandpa.jpg", location_id: boarding_house.id },
  { name: "Grandma Gertie", role: "Arnold’s grandmother", description: "Loving and quirky, with a flair for the dramatic.", image_url: "grandma.jpg", location_id: boarding_house.id }
]

characters.each do |char|
  Character.create!(char)
end


characters.each do |char|
  Character.create!(char)
end

puts "Seeded #{Character.count} characters successfully!"

# --- Episodes ---
episodes = [
  { title: "Arnold's Christmas", season: 1, episode_number: 1, description: "Arnold tries to find the perfect gift for Helga." },
  { title: "Helga on the Couch", season: 2, episode_number: 5, description: "Helga shares her secrets and feelings during therapy." },
  { title: "Gerald's Secret", season: 2, episode_number: 8, description: "Gerald tries to keep a big secret from his friends." },
  { title: "Arnold Saves the Day", season: 3, episode_number: 2, description: "Arnold steps in to solve problems around the neighborhood." }
]

episodes.each do |ep|
  Episode.create!(ep)
end

puts "Seeded #{Episode.count} episodes successfully!"

# --- Quotes ---
# Find characters and episodes first
arnold = Character.find_by(name: "Arnold Shortman")
helga = Character.find_by(name: "Helga Pataki")
gerald = Character.find_by(name: "Gerald Johanssen")
phoebe = Character.find_by(name: "Phoebe Heyerdahl")
grandpa = Character.find_by(name: "Grandpa Phil")

ep1 = Episode.find_by(title: "Arnold's Christmas")
ep2 = Episode.find_by(title: "Helga on the Couch")
ep3 = Episode.find_by(title: "Gerald's Secret")
ep4 = Episode.find_by(title: "Arnold Saves the Day")


quotes = [
  { text: "Move it, football head!", character: helga, episode: ep1 },
  { text: "It's all part of the plan.", character: arnold, episode: ep2 },
  { text: "I’ve got a secret!", character: gerald, episode: ep3 },
  { text: "Sometimes you just gotta help a friend.", character: grandpa, episode: ep4 },
  { text: "Being smart isn’t everything, you gotta have heart too.", character: phoebe, episode: ep2 }
]

quotes.each do |q|
  Quote.create!(q)
end


puts "Seeded #{Quote.count} quotes successfully!"
puts "Seeding complete!"
