# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puppy = File.open('db/seeds/Puppy_2.jpg')
fandm = School.create(name: "Franklin & Marshall", country: "USA", state: "Pennsylvania", city: "Lancaster")
me = fandm.users.create(username: "Maxwell", password: "maxwell", email: "msechzer@example.com")
test_course = fandm.courses.create(title: "Intro to Testing Decks", course_code: "app110", instructor: "Test Guy")
test_deck = me.decks.create(title: "Test", description: "This is the Test Deck", course_id: test_course.id)
me.registrations.create(course_id: test_course.id)
test_deck.cards.create([
  {front: "Front side test", back: "Back side test", format: "response"},
  {front: "Front side test2", back: "Back side test2", format: "response"},
  {front: "Who was George Washington?", back: "The first president of the USA", format: "response"},
  {front: "What is generally considered the smartest bird?", back: "The common crow", format: "response"},
  {front: "Gary Numan is how many weeks older than Gary Oldman?", back: "Two weeks", format: "response"},
  {front: "Who invented the word 'eyeball'?", back: "William Shakespeare", format: "response"},
  {front: "What is Albus Dumbledore's not so secret vice?", back: "Candy", format: "response"},
  {front: "Puppy", back: "true", format: "boolean", image: puppy}
])

guest = fandm.users.create(username: "Guest", password: "password", email: "guest@example.com")
test_deck = guest.decks.create(title: "Assorted Notes", description: "This is from my first day of school", course_id: test_course.id)
guest.registrations.create(course_id: test_course.id)
test_deck.cards.create([
  {front: "What is 10 divided by 5", back: "2", format: "response"},
  {front: "What is the most dangerous sport", back: "Eventing", format: "response"},
  {front: "Ben Franklin was the 3rd president of the USA", back: "false", format: "boolean"},
  {front: "Who painted the 'Joy of Life'", back: "Matisse", format: "choice"},
  {front: "Who painted the 'Bar at the Folies-Bergere'", back: "Manet", format: "choice"},
  {front: "Which impressionist had a fascination with dancers", back: "Degas", format: "choice"},
  {front: "Which impressionist lived in a brothel", back: "Tolouse-Loutrec", format: "choice"},
  {front: "What is the full name of the artist who painted 'Nocturne in Black and Gold'", back: "{\"first\":\"James\",\"second\":\"Abbott\",\"third\":\"McNeill\",\"last\":\"Whistler\"}", format: "field"},
  {front: "Puppy", back: "true", format: "boolean", image: puppy}
  ])
