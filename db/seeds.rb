School.create!([
  {name: "Franklin & Marshall", country: "USA", state: "Pennsylvania", city: "Lancaster"}
])
User.create!([
  {username: "Maxwell", email: "msechzer@example.com", password: "maxwell", school_id: 1},
  {username: "Guest", email: "guest@example.com", password: "password", school_id: 1}
])
Course.create!([
  {title: "Intro to Testing Decks", course_code: "app110", instructor: "Test Guy", school_id: 1}
])
Registration.create!([
  {course_id: 1, user_id: 1},
  {course_id: 1, user_id: 2}
])
Deck.create!([
  {title: "Test", description: "This is the Test Deck", user_id: 1, course_id: 1},
  {title: "Assorted Notes", description: "This is from my first day of school", user_id: 2, course_id: 1},
  {title: "Trivia", description: "Random Facts!", user_id: 2, course_id: 1}
])
Card.create!([
  {front: "Front side test", back: "Back side test", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Front side test2", back: "Back side test2", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Who was George Washington?", back: "The first president of the USA", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "What is generally considered the smartest bird?", back: "The common crow", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Gary Numan is how many weeks older than Gary Oldman?", back: "Two weeks", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Who invented the word 'eyeball'?", back: "William Shakespeare", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "What is Albus Dumbledore's not so secret vice?", back: "Candy", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Puppy", back: "true", format: "boolean", deck_id: 1, image_file_name: "Puppy_2.jpg", image_content_type: "image/jpeg", image_file_size: 49057, image_updated_at: "2015-01-14 14:24:35"},
  {front: "What is 10 divided by 5", back: "2", format: "response", deck_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "What is the most dangerous sport", back: "Eventing", format: "response", deck_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Ben Franklin was the 3rd president of the USA", back: "false", format: "boolean", deck_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Who painted the 'Joy of Life'", back: "Matisse", format: "choice", deck_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Who painted the 'Bar at the Folies-Bergere'", back: "Manet", format: "choice", deck_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Which impressionist had a fascination with dancers", back: "Degas", format: "choice", deck_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Which impressionist lived in a brothel", back: "Tolouse-Loutrec", format: "choice", deck_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "What is the full name of the artist who painted 'Nocturne in Black and Gold'", back: "{\"first\":\"James\",\"second\":\"Abbott\",\"third\":\"McNeill\",\"last\":\"Whistler\"}", format: "field", deck_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Birdie", back: "true", format: "boolean", deck_id: 1, created_at: "2015-01-15 13:45:25", updated_at: "2015-01-15 13:45:25", image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 6054452, image_updated_at: "2015-01-15 13:45:23"},
  {front: "The most common name in the world", back: "Mohammed", format: "response", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "What does karaoke mean in japanese?", back: "Empty Orchestra", format: "response", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "How many bones are in the human body?", back: "206", format: "response", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Each ear has 2 bones", back: "false", format: "boolean", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "In what year did it become legal for women to wear pants in Paris to wear pants", back: "2012", format: "response", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil}
])
Test.create!([
  {deck_id: 1, user_id: 2},
  {deck_id: 1, user_id: 2},
  {deck_id: 1, user_id: 2},
  {deck_id: 2, user_id: 2},
  {deck_id: 3, user_id: 2},
  {deck_id: 1, user_id: 2}
])
Response.create!([
  {response_text: "Back side test", test_id: 1, card_id: 1},
  {response_text: "Back side test2", test_id: 1, card_id: 2},
  {response_text: "The first president of the USA", test_id: 1, card_id: 3},
  {response_text: "The common crow", test_id: 1, card_id: 4},
  {response_text: "Two weeks", test_id: 1, card_id: 5},
  {response_text: "William Shakespeare", test_id: 1, card_id: 6},
  {response_text: "Candy", test_id: 1, card_id: 7},
  {response_text: "true", test_id: 1, card_id: 8},
  {response_text: "Back side test", test_id: 2, card_id: 1},
  {response_text: "Back side test2", test_id: 2, card_id: 2},
  {response_text: "The first president of the USA", test_id: 2, card_id: 3},
  {response_text: "The common crow", test_id: 2, card_id: 4},
  {response_text: "Two weeks", test_id: 2, card_id: 5},
  {response_text: "William Shakespeare", test_id: 2, card_id: 6},
  {response_text: "Candy", test_id: 2, card_id: 7},
  {response_text: "true", test_id: 2, card_id: 8},
  {response_text: "back side", test_id: 3, card_id: 1},
  {response_text: "other back side", test_id: 3, card_id: 2},
  {response_text: "President", test_id: 3, card_id: 3},
  {response_text: "The common crow", test_id: 3, card_id: 4},
  {response_text: "Two weeks", test_id: 3, card_id: 5},
  {response_text: "William Shakespeare", test_id: 3, card_id: 6},
  {response_text: "Candy", test_id: 3, card_id: 7},
  {response_text: "true", test_id: 3, card_id: 8},
  {response_text: "2", test_id: 4, card_id: 9},
  {response_text: "Eventing", test_id: 4, card_id: 10},
  {response_text: "true", test_id: 4, card_id: 11},
  {response_text: "Matisse", test_id: 4, card_id: 12},
  {response_text: "Manet", test_id: 4, card_id: 13},
  {response_text: "Degas", test_id: 4, card_id: 14},
  {response_text: "Tolouse-Loutrec", test_id: 4, card_id: 15},
  {response_text: "[\"James\",\"Abbott\",\"McNeill\",\"Whistler\"]", test_id: 4, card_id: 16},
  {response_text: "true", test_id: 4, card_id: 17},
  {response_text: "Mohammed", test_id: 5, card_id: 18},
  {response_text: "Empty Orchestra", test_id: 5, card_id: 19},
  {response_text: "206", test_id: 5, card_id: 20},
  {response_text: "false", test_id: 5, card_id: 21},
  {response_text: "2012", test_id: 5, card_id: 22},
  {response_text: "Back side test", test_id: 6, card_id: 1},
  {response_text: "Back side test2", test_id: 6, card_id: 2},
  {response_text: "The first president of the USA", test_id: 6, card_id: 3},
  {response_text: "The common crow", test_id: 6, card_id: 4},
  {response_text: "Two weeks", test_id: 6, card_id: 5},
  {response_text: "William Shakespeare", test_id: 6, card_id: 6},
  {response_text: "Candy", test_id: 6, card_id: 7},
  {response_text: "true", test_id: 6, card_id: 8}
])
