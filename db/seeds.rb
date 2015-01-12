# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
  {front: "What is Albus Dumbledore's not so secret vice?", back: "Candy", format: "response"}
])
