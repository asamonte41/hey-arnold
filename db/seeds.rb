# db/seeds.rb

puts "Seeding data..."

# --- Locations ---
# Only create locations if they don't exist
school = Location.find_or_create_by!(name: "P.S. 118") do |loc|
  loc.description = "The elementary school where Arnold and his friends study."
end

neighborhood = Location.find_or_create_by!(name: "Hillwood") do |loc|
  loc.description = "The neighborhood where the main characters live."
end

boarding_house = Location.find_or_create_by!(name: "Sunset Arms Boarding House") do |loc|
  loc.description = "Arnold's home, run by his grandparents."
end

# --- Characters ---
character_list = [
  { name: "Arnold Shortman", role: "Main Character", description: "An optimistic and kind fourth grader with a unique football-shaped head.", image_url: "arnold.png", location: boarding_house },
  { name: "Helga Pataki", role: "Arnold’s classmate and secret admirer", description: "Smart, tough, and sarcastic, but secretly in love with Arnold.", image_url: "helga.jpg", location: school },
  { name: "Gerald Johanssen", role: "Arnold’s best friend", description: "Cool, loyal, and smooth-talking. Known for his tall hair and great storytelling.", image_url: "gerald.jpg", location: neighborhood },
  { name: "Phoebe Heyerdahl", role: "Helga’s best friend", description: "Sweet, intelligent, and often the voice of reason for Helga.", image_url: "phoebe.jpg", location: school },
  { name: "Harold Berman", role: "Class bully", description: "Tough on the outside, but has a sensitive side.", image_url: "harold.jpg", location: school },
  { name: "Rhonda Wellington Lloyd", role: "Fashionable classmate", description: "Rich, stylish, and sometimes self-centered, but loyal to her friends.", image_url: "rhonda.jpg", location: school },
  { name: "Sid", role: "Arnold’s friend", description: "Superstitious and anxious, but means well.", image_url: "sid.jpg", location: neighborhood },
  { name: "Stinky Peterson", role: "Arnold’s friend", description: "Tall, slow-talking, and honest. Has a surprisingly kind heart.", image_url: "stinky.jpg", location: neighborhood },
  { name: "Grandpa Phil", role: "Arnold’s grandfather", description: "Funny, wise, and a bit eccentric.", image_url: "grandpa.jpg", location: boarding_house },
  { name: "Grandma Gertie", role: "Arnold’s grandmother", description: "Loving and quirky, with a flair for the dramatic.", image_url: "grandma.jpg", location: boarding_house }
]

character_list.each do |char|
  Character.find_or_create_by!(name: char[:name]) do |c|
    c.role = char[:role]
    c.description = char[:description]
    c.image_url = char[:image_url]
    c.location = char[:location]
  end
end

puts "Characters seeded or already exist: #{Character.count}"

# --- Episodes ---
episode_list = [
  { title: "Arnold's Christmas", season: 1, episode_number: 1, description: "Arnold tries to find the perfect gift for Helga." },
  { title: "Helga on the Couch", season: 2, episode_number: 5, description: "Helga shares her secrets and feelings during therapy." },
  { title: "Gerald's Secret", season: 2, episode_number: 8, description: "Gerald tries to keep a big secret from his friends." },
  { title: "Arnold Saves the Day", season: 3, episode_number: 2, description: "Arnold steps in to solve problems around the neighborhood." },
  { title: "The Journal", season: 1, episode_number: 2, description: "Arnold discovers a journal with secrets." },
  { title: "Grandma’s Birthday", season: 1, episode_number: 3, description: "Arnold plans a surprise for Grandma Gertie." },
  { title: "Helga's Valentine", season: 2, episode_number: 10, description: "Helga struggles to confess her feelings." }
]

episode_list.each do |ep|
  Episode.find_or_create_by!(title: ep[:title]) do |e|
    e.season = ep[:season]
    e.episode_number = ep[:episode_number]
    e.description = ep[:description]
  end
end

puts "Episodes seeded or already exist: #{Episode.count}"

# --- Quotes (manual ones first) ---
arnold = Character.find_by(name: "Arnold Shortman")
helga = Character.find_by(name: "Helga Pataki")
gerald = Character.find_by(name: "Gerald Johanssen")
phoebe = Character.find_by(name: "Phoebe Heyerdahl")
grandpa = Character.find_by(name: "Grandpa Phil")

ep1 = Episode.find_by(title: "Arnold's Christmas")
ep2 = Episode.find_by(title: "Helga on the Couch")
ep3 = Episode.find_by(title: "Gerald's Secret")
ep4 = Episode.find_by(title: "Arnold Saves the Day")

manual_quotes = [
  { text: "Move it, football head!", character: helga, episode: ep1 },
  { text: "It's all part of the plan.", character: arnold, episode: ep2 },
  { text: "I’ve got a secret!", character: gerald, episode: ep3 },
  { text: "Sometimes you just gotta help a friend.", character: grandpa, episode: ep4 },
  { text: "Being smart isn’t everything, you gotta have heart too.", character: phoebe, episode: ep2 }
]

manual_quotes.each do |q|
  Quote.find_or_create_by!(text: q[:text], character: q[:character], episode: q[:episode])
end

# --- Faker-generated quotes to reach 200+ total rows ---
characters = Character.all
episodes = Episode.all

current_quotes_count = Quote.count
needed_quotes = 200 - current_quotes_count

needed_quotes.times do
  Quote.create!(
    text: Faker::TvShows::HeyArnold.quote,
    character: characters.sample,
    episode: episodes.sample
  )
end

puts "Total quotes now: #{Quote.count}"
puts "Seeding complete!"
