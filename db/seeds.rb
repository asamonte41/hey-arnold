# db/seeds.rb

puts "Seeding data..."

# Clear old data first
Appearance.destroy_all
Character.destroy_all
Episode.destroy_all
Location.destroy_all

# Create locations
school = Location.create!(name: "P.S. 118", description: "The elementary school where Arnold and his friends study.")
neighborhood = Location.create!(name: "Hillwood", description: "The neighborhood where the main characters live.")
boarding_house = Location.create!(name: "Sunset Arms Boarding House", description: "Arnold's home, run by his grandparents.")

# Characters
characters = [
  {
    name: "Arnold Shortman",
    role: "Main Character",
    description: "An optimistic and kind fourth grader with a unique football-shaped head.",
    image_url: "arnold.png",
    location: boarding_house
  },
  {
    name: "Helga Pataki",
    role: "Arnold’s classmate and secret admirer",
    description: "Smart, tough, and sarcastic, but secretly in love with Arnold.",
    image_url: "helga.jpg",
    location: school
  },
  {
    name: "Gerald Johanssen",
    role: "Arnold’s best friend",
    description: "Cool, loyal, and smooth-talking. Known for his tall hair and great storytelling.",
    image_url: "gerald.jpg",
    location: neighborhood
  },
  {
    name: "Phoebe Heyerdahl",
    role: "Helga’s best friend",
    description: "Sweet, intelligent, and often the voice of reason for Helga.",
    image_url: "phoebe.jpg",
    location: school
  },
  {
    name: "Harold Berman",
    role: "Class bully",
    description: "Tough on the outside, but has a sensitive side.",
    image_url: "harold.jpg",
    location: school
  },
  {
    name: "Rhonda Wellington Lloyd",
    role: "Fashionable classmate",
    description: "Rich, stylish, and sometimes self-centered, but loyal to her friends.",
    image_url: "rhonda.jpg",
    location: school
  },
  {
    name: "Sid",
    role: "Arnold’s friend",
    description: "Superstitious and anxious, but means well.",
    image_url: "sid.jpg",
    location: neighborhood
  },
  {
    name: "Stinky Peterson",
    role: "Arnold’s friend",
    description: "Tall, slow-talking, and honest. Has a surprisingly kind heart.",
    image_url: "stinky.jpg",
    location: neighborhood
  },
  {
    name: "Grandpa Phil",
    role: "Arnold’s grandfather",
    description: "Funny, wise, and a bit eccentric.",
    image_url: "grandpa.jpg",
    location: boarding_house
  },
  {
    name: "Grandma Gertie",
    role: "Arnold’s grandmother",
    description: "Loving and quirky, with a flair for the dramatic.",
    image_url: "grandma,jpg",
    location: boarding_house
  }
]

characters.each do |char|
  Character.create!(char)
end

puts "Seeded #{Character.count} characters successfully!"
