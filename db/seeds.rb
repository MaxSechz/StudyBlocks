School.create!([
  {name: "Franklin & Marshall", country: "USA", state: "Pennsylvania", city: "Lancaster"}
])
User.create!([
  {username: "Guest", email: "guest@example.com", password_digest: "$2a$10$9HyCvqy2R7nkWwHnHH2t..YnSYB8iAn8KXedrgyON1fn015crU5HC", session_token: "X4GW_CMINosaZKIDrvyq5A", school_id: 1},
  {username: "Maxwell", email: "msechzer@example.com", password_digest: "$2a$10$AOv.BhbiLapDGWbwNTMemOB7bBJTDgBvzKXjf/UCvurj0J1TrBpxi", session_token: "5p6dOQgBzsu9_gU5yC11bg", school_id: 1},
  {username: "Nora", email: "nora@example.com", password_digest: "$2a$10$X9D7IqpNuojE2EJONnzWkuiGxXCsruHbg89I8KIPdIK...", session_token: "5NGGiz_Np_9o_5JPSxQgnQ", school_id: 1}
])
Course.create!([
  {title: "Intro to Western Art", course_code: "ART 105", instructor: "Test Guy", school_id: 1},
  {title: "Intro to Eastern Art", course_code: "ART 103", instructor: "Test Guy", school_id: 1},
  {title: "Microeconomics", course_code: "ECO 200", instructor: "Susan Guy", school_id: 1},
])
Registration.create!([
  {course_id: 1, user_id: 1},
  {course_id: 1, user_id: 2},
  {course_id: 2, user_id: 1},
  {course_id: 3, user_id: 1},
  {course_id: 1, user_id: 3},
  {course_id: 2, user_id: 3},
  {course_id: 3, user_id: 3},
])
Deck.create!([
  {title: "Test", description: "This is the Test Deck", user_id: 2, course_id: 0},
  {title: "Assorted Notes", description: "This is from my first day of school", user_id: 2, course_id: 0},
  {title: "Trivia", description: "Random Facts!", user_id: 3, course_id: 0},
  {title: "Testing some images", description: "Images of cute animals", user_id: 1, course_id: 3},
  {title: "Western Art Final", description: "From early classical to modern art", user_id: 1, course_id: 1}
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
  {front: "What is the full name of the artist who painted 'Nocturne in Black and Gold'", back: "{\"First\":\"James\",\"Second\":\"Abbott\",\"Third\":\"McNeill\",\"Last\":\"Whistler\"}", format: "field", deck_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Birdie", back: "true", format: "boolean", deck_id: 1, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 6054452, image_updated_at: "2015-01-15 13:45:23"},
  {front: "The most common name in the world", back: "Mohammed", format: "response", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "What does karaoke mean in japanese?", back: "Empty Orchestra", format: "response", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "How many bones are in the human body?", back: "206", format: "response", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Each ear has 2 bones", back: "false", format: "boolean", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "In what year did it become legal for women to wear pants in Paris to wear pants", back: "2012", format: "response", deck_id: 3, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "What melted in the pocket of the inventor of the microwave", back: "Chocolate", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "What is the farthest north I've seen a painted bunting?", back: "Lancaster PA", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: nil, back: "bunny", format: "choice", deck_id: 4, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 22439, image_updated_at: "2015-01-15 22:52:40"},
  {front: nil, back: "cuttlefish", format: "choice", deck_id: 4, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 397648, image_updated_at: "2015-01-15 22:52:40"},
  {front: nil, back: "dik dik", format: "choice", deck_id: 4, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 28823, image_updated_at: "2015-01-15 22:55:42"},
  {front: "What is the capital of Pennsylvania?", back: "Harrisburg", format: "response", deck_id: 1, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: nil, back: "sea otter", format: "choice", deck_id: 4, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 109996, image_updated_at: "2015-01-15 23:10:12"},
  {front: nil, back: "seal", format: "choice", deck_id: 4, image_file_name: "data", image_content_type: "image/png", image_file_size: 314980, image_updated_at: "2015-01-15 23:41:23"},
  {front: nil, back: "A Sunday afternoon on the Island of La Gran Jatte\nSeurat\n\nPostimpressionism\n\n1885-1900\n\nFrench", format: "response", deck_id: 5, image_file_name: "capture-142E3AC9AD355586BAC.png", image_content_type: "image/png", image_file_size: 1535597, image_updated_at: "2015-01-22 04:19:44"},
  {front: nil, back: "Still life with a Basket of Apples\nCezanne\n\n\nPostimpressionism\n\n1885-1900\n\nFrench", format: "response", deck_id: 5, image_file_name: "capture2-142E3AE0AA462404921.png", image_content_type: "image/png", image_file_size: 1718537, image_updated_at: "2015-01-22 04:19:46"},
  {front: nil, back: "Starry Night\nVan Gogh\n\n\nPostimpressionism\n\n1885-1900\n\nFrench", format: "response", deck_id: 5, image_file_name: "capture3-142E3AE95673B1AC380.png", image_content_type: "image/png", image_file_size: 2095911, image_updated_at: "2015-01-22 04:19:48"},
  {front: nil, back: "Manao Tupapau\nGauguin\n\n\nPostimpressionism\n\n1885-1900\n\nFrench", format: "response", deck_id: 5, image_file_name: "capture1-142E3AEEA940BDEC240.png", image_content_type: "image/png", image_file_size: 1716846, image_updated_at: "2015-01-22 04:19:49"},
  {front: nil, back: "Unique Forms of Continuity in Space\nBoccioni\n\nFuturism\n\nItalian\n\n1910-1930", format: "response", deck_id: 5, image_file_name: "captur7e-142E3B004302530C759.png", image_content_type: "image/png", image_file_size: 785141, image_updated_at: "2015-01-22 04:19:50"},
  {front: nil, back: "Red-Blue chair\nRietveld\n\nDe Stijl\n\nDutch\n\n 1910-1930", format: "response", deck_id: 5, image_file_name: "capture8-142E3B0CC26403A8CBA.png", image_content_type: "image/png", image_file_size: 453425, image_updated_at: "2015-01-22 04:19:51"},
  {front: nil, back: "Bauhaus\nGropius\n\nModernism\n\nGerman\n\n 1910-1930", format: "response", deck_id: 5, image_file_name: "captur8e-142E3B15DC360216771.png", image_content_type: "image/png", image_file_size: 1012188, image_updated_at: "2015-01-22 04:19:52"},
  {front: nil, back: "Detroit industry\nRivera\n\nMuralism\n\nMexican\n\n 1910-1930", format: "response", deck_id: 5, image_file_name: "capture9-142E3B1F18F49C230B1.png", image_content_type: "image/png", image_file_size: 1504698, image_updated_at: "2015-01-22 04:19:53"},
  {front: nil, back: "Joy of Life\nMatisse\n\nFauvism\n\nFrench\n\nc. 1910", format: "response", deck_id: 5, image_file_name: "capture6-142E3B486536A8202F4.png", image_content_type: "image/png", image_file_size: 1830802, image_updated_at: "2015-01-22 04:19:54"},
  {front: nil, back: "Demoiselles d'Avignon\nPicasso\n\nCubism\n\nFrench/Spanish\n\n c. 1910", format: "response", deck_id: 5, image_file_name: "capture7-142E3B5095A7C4F883D.png", image_content_type: "image/png", image_file_size: 2815479, image_updated_at: "2015-01-22 04:19:55"},
  {front: nil, back: "Street, Berlin\nKirchner\n\nExpressionism\n\nGerman\n\n c. 1910", format: "response", deck_id: 5, image_file_name: "capture4-142E3B5C9E933A1CBCA.png", image_content_type: "image/png", image_file_size: 2017258, image_updated_at: "2015-01-22 04:19:56"},
  {front: nil, back: "Self-Portrait\nModersohn-Becker\n\nExpressionism\n\nGerman\n\n c. 1910", format: "response", deck_id: 5, image_file_name: "capture5-142E3B6443569BC50D0.png", image_content_type: "image/png", image_file_size: 1854851, image_updated_at: "2015-01-22 04:19:58"},
  {front: nil, back: "Fountain\nDuchamp\n\nDada\n\nFrench/American\n\n1910-1930", format: "response", deck_id: 5, image_file_name: "cap3ture-142E3B774364AFF2F95.png", image_content_type: "image/png", image_file_size: 1441287, image_updated_at: "2015-01-22 04:19:59"},
  {front: nil, back: "War Cripples Playing Cards\nDix\n\nDada\n\nGerman\n\n1910-1930", format: "response", deck_id: 5, image_file_name: "ca1pture-142E3B844832E7F355B.png", image_content_type: "image/png", image_file_size: 308035, image_updated_at: "2015-01-22 04:20:00"},
  {front: nil, back: "The persistence of Memory\nDali\n\nSpanish\n\nSurrealism\n\n1920-1945", format: "response", deck_id: 5, image_file_name: "7capture-142E3B8E8DF6892488A.png", image_content_type: "image/png", image_file_size: 732731, image_updated_at: "2015-01-22 04:20:00"},
  {front: nil, back: "The treachery of Images\nMagritte\n\nBelgian\n\n\nSurrealism\n\n1920-1945", format: "response", deck_id: 5, image_file_name: "ca6pture-142E3B9846F64ADD91B.png", image_content_type: "image/png", image_file_size: 926670, image_updated_at: "2015-01-22 04:20:01"},
  {front: nil, back: "Object\nOppenheim\n\nSwiss\n\n\nSurrealism\n\n1920-1945", format: "response", deck_id: 5, image_file_name: "ca14pture-142E3BA10BD19DC9DAA.png", image_content_type: "image/png", image_file_size: 840756, image_updated_at: "2015-01-22 04:20:02"},
  {front: nil, back: "The Seagram Building\nMies van der Rohe\n\nInternational Style Architecture\n\n1945-1960\n\nAmerican", format: "response", deck_id: 5, image_file_name: "ca12pture-142E3BA83072EF63367.png", image_content_type: "image/png", image_file_size: 1181407, image_updated_at: "2015-01-22 04:20:03"},
  {front: nil, back: "The Farnsworth House\n\nMies van der Rohe\n\nInternational Style Architecture\n\n1945-1960\n\nAmerican", format: "response", deck_id: 5, image_file_name: "captur55e-142E3BB5CCD48161136.png", image_content_type: "image/png", image_file_size: 1649780, image_updated_at: "2015-01-22 04:20:04"},
  {front: nil, back: "Number 1\nPollock\n\nAbstract Expressionism\n\nAmerican\n\n1945-1960", format: "response", deck_id: 5, image_file_name: "cap33ture-142E3BBDF003B624809.png", image_content_type: "image/png", image_file_size: 1884978, image_updated_at: "2015-01-22 04:20:06"},
  {front: nil, back: "Number 10\nRothko\n\n\nAbstract Expressionism\n\nAmerican\n\n1945-1960", format: "response", deck_id: 5, image_file_name: "capt1234ure-142E3BCA86D566172F5.png", image_content_type: "image/png", image_file_size: 1044916, image_updated_at: "2015-01-22 04:20:07"},
  {front: nil, back: "Marilyn Monroe Dyptich\nWarhol\n\nPostmodernism\n\nAmerican\n\n1960-Present", format: "response", deck_id: 5, image_file_name: "c34apture-142E3BD48580A58F101.png", image_content_type: "image/png", image_file_size: 1559238, image_updated_at: "2015-01-22 04:20:08"},
  {front: nil, back: "The Dinner Party\nChicago\n\n\nPostmodernism\n\nAmerican\n\n1960-Present", format: "response", deck_id: 5, image_file_name: "captur567e-142E3BF47163B0BAF28.png", image_content_type: "image/png", image_file_size: 1343387, image_updated_at: "2015-01-22 04:20:09"},
  {front: nil, back: "Rabbit\nKoons\n\n\nPostmodernism\n\nAmerican\n\n1960-Present", format: "response", deck_id: 5, image_file_name: "captutgre-142E3BFEAA815CF6812.png", image_content_type: "image/png", image_file_size: 741497, image_updated_at: "2015-01-22 04:20:10"},
  {front: nil, back: "Parthenon\nGreek\n\nClassical\n\n450-320 BC", format: "response", deck_id: 5, image_file_name: "parth-142E3DF0D6606FB1D00.png", image_content_type: "image/png", image_file_size: 1234339, image_updated_at: "2015-01-22 04:20:11"},
  {front: nil, back: "The Riace Warriors\nGreek\n\nEarly Classical\n\n480-450 BC", format: "response", deck_id: 5, image_file_name: "riace-142E3DF40EB1F523E04.png", image_content_type: "image/png", image_file_size: 717935, image_updated_at: "2015-01-22 04:20:12"},
  {front: nil, back: "The Pantheon\nRoman\n\nEmpire\n\n27-200 CE", format: "response", deck_id: 5, image_file_name: "pantheon-142E3DF8C536D40EE0D.png", image_content_type: "image/png", image_file_size: 1366757, image_updated_at: "2015-01-22 04:20:13"},
  {front: nil, back: "The Arch of Constantine Oration\nRoman\n\nLate Empire\n\n200-476 CE", format: "response", deck_id: 5, image_file_name: "oratio-142E3E0069446B6B0F5.png", image_content_type: "image/png", image_file_size: 492458, image_updated_at: "2015-01-22 04:20:14"},
  {front: nil, back: "The Arch of constantine Donation\nRoman\n\nLate empire\n\n200-476 CE", format: "response", deck_id: 5, image_file_name: "donatio-142E3E0302168CBCA10.png", image_content_type: "image/png", image_file_size: 490257, image_updated_at: "2015-01-22 04:20:14"},
  {front: nil, back: "The Church of San Vitale\nRavenna\n\nByzantine\n\n500-1453 CE", format: "response", deck_id: 5, image_file_name: "vitale-142E3E06CD41FF4A180.png", image_content_type: "image/png", image_file_size: 1343309, image_updated_at: "2015-01-22 04:20:15"},
  {front: nil, back: "The Church of San Vitale - Justinian and his attendants \nRavenna\n\nByzantine\n\n500-1453 CE", format: "response", deck_id: 5, image_file_name: "justinianvitale-142E3E09764551EEB7D.png", image_content_type: "image/png", image_file_size: 2381205, image_updated_at: "2015-01-22 04:20:16"},
  {front: nil, back: "Hildesheim Doors\nCommissioned by Bishop Bernward\n\nOttonian\n\nc. 1000", format: "response", deck_id: 5, image_file_name: "hildies-142E3E0CEEC1EC17D3D.png", image_content_type: "image/png", image_file_size: 1708540, image_updated_at: "2015-01-22 04:20:18"},
  {front: nil, back: "Last Judgement Tympanum\nAbbey and Pilgrinage Church of Conques\n\nRomanesque\n\n1000-1200\n\nFrench", format: "response", deck_id: 5, image_file_name: "abbeychurch-142E3E0E8142193FA3B.png", image_content_type: "image/png", image_file_size: 1605077, image_updated_at: "2015-01-22 04:20:19"},
  {front: nil, back: "Cathedral of Notre Dame at Chartres\nGothic\n\n1140-1500\n\nFrench", format: "response", deck_id: 5, image_file_name: "chartes-142E3E11E3F512F87E8.png", image_content_type: "image/png", image_file_size: 1502116, image_updated_at: "2015-01-22 04:20:21"},
  {front: nil, back: "Birth of Venus\nBotticelli\n\nEarly Renaissance\n\n1300-1500\n\nItalian", format: "response", deck_id: 5, image_file_name: "venus-142E3E14E8C4871D587.png", image_content_type: "image/png", image_file_size: 1519682, image_updated_at: "2015-01-22 04:20:22"},
  {front: nil, back: "Self-Portrait\nDurer\n\nRenaissance\n\n1490-1525\n\nGerman", format: "response", deck_id: 5, image_file_name: "durer-142E3E16C790C0C610B.png", image_content_type: "image/png", image_file_size: 957237, image_updated_at: "2015-01-22 04:20:23"},
  {front: nil, back: "School of Athens\nRaphael\n\nRenaissance\n\n1490-1525\n\nItalian", format: "response", deck_id: 5, image_file_name: "athens-142E3E1881D24756F38.png", image_content_type: "image/png", image_file_size: 1251841, image_updated_at: "2015-01-22 04:20:24"},
  {front: nil, back: "Venus of Urbino\nTitian\n\nLate renaissance\n\n1525-1600\n\nItalian", format: "response", deck_id: 5, image_file_name: "urbinpo-142E3E1B31B3C50A74E.png", image_content_type: "image/png", image_file_size: 1314938, image_updated_at: "2015-01-22 04:20:25"},
  {front: nil, back: "St Peters Bassilica\nBernini\n\nBaroque\n\n1600-1700\n\nItalian", format: "response", deck_id: 5, image_file_name: "peter-142E3E1E25F4BCC6049.png", image_content_type: "image/png", image_file_size: 1483307, image_updated_at: "2015-01-22 04:20:26"},
  {front: nil, back: "Baldacchino -  St Peters Bassilica \nBernini\n\nBaroque\n\n1600-1700\n\nItalian", format: "response", deck_id: 5, image_file_name: "bald-142E433427B3F4A0A4B.png", image_content_type: "image/png", image_file_size: 1898082, image_updated_at: "2015-01-22 04:20:28"},
  {front: nil, back: "Chair of  St Peters Bassilica \nBernini\n\nBaroque\n\n1600-1700\n\nItalian", format: "response", deck_id: 5, image_file_name: "throne-142E3E21B2759F33FDB.png", image_content_type: "image/png", image_file_size: 1923553, image_updated_at: "2015-01-22 04:20:29"},
  {front: nil, back: "The anatomy Lesson of Dr. Kulp\nRembrandt\n\nBaroque\n\n1600-1700\n\nDutch", format: "response", deck_id: 5, image_file_name: "captremure-142E3E2537661995AE5.png", image_content_type: "image/png", image_file_size: 1241087, image_updated_at: "2015-01-22 04:20:30"},
  {front: nil, back: "The Swing\nFragonard\n\nRococo\n\n1700-1780\n\nFrench", format: "response", deck_id: 5, image_file_name: "swinf-142E3E276D54FDAD869.png", image_content_type: "image/png", image_file_size: 2039576, image_updated_at: "2015-01-22 04:20:31"},
  {front: nil, back: "Philosopher giving a Lecture on an Orrery\nWright of Derby\n\nRomanticism\n\n1750-1840\n\nBritish", format: "response", deck_id: 5, image_file_name: "philo-142E3E2B9B51782E7CA.png", image_content_type: "image/png", image_file_size: 879366, image_updated_at: "2015-01-22 04:20:32"},
  {front: nil, back: "Oath of the Horatii\nDavid\n\nNeoclassicism\n\n1750-1840\n\nFrench", format: "response", deck_id: 5, image_file_name: "oatjh-142E3E2E5405FA7668A.png", image_content_type: "image/png", image_file_size: 1407801, image_updated_at: "2015-01-22 04:20:33"},
  {front: nil, back: "Executions of the 3rd of May, 1808\nGoya\n\nRomanticism\n\nSpanish\n\n1750-1840", format: "response", deck_id: 5, image_file_name: "goya-142E3E309254A9A5DB5.png", image_content_type: "image/png", image_file_size: 1479296, image_updated_at: "2015-01-22 04:20:34"},
  {front: nil, back: "The Crystal Palace\nPaxton\n\nModern Architecture\n\nc. 1850\n\nBritish", format: "response", deck_id: 5, image_file_name: "pax-142E3E32A420725D0B6.png", image_content_type: "image/png", image_file_size: 1220662, image_updated_at: "2015-01-22 04:20:35"},
  {front: nil, back: "Bar at the Folies-Bergere\nManet\n\nImpressionism\n\n1865-1890\n\nFrench", format: "response", deck_id: 5, image_file_name: "folies-142E3E359263213E617.png", image_content_type: "image/png", image_file_size: 1841352, image_updated_at: "2015-01-22 04:20:37"},
  {front: nil, back: "The Golden Stairs\nBurne-Jones\n\nAesthetic Movement\n\n1860-1890\n\nBritish", format: "response", deck_id: 5, image_file_name: "bunre-142E3E3A6FE6B88EA81.png", image_content_type: "image/png", image_file_size: 1203243, image_updated_at: "2015-01-22 04:20:39"},
  {front: nil, back: "Birth of Athena - Parthenon\nGreek\n\nClassical\n\n450-320 BC", format: "response", deck_id: 5, image_file_name: "birf-142E3E4CEE278BF4C1E.png", image_content_type: "image/png", image_file_size: 455269, image_updated_at: "2015-01-22 04:20:39"}
])
Test.create!([
  {deck_id: 1, user_id: 2},
  {deck_id: 1, user_id: 2},
  {deck_id: 1, user_id: 2},
  {deck_id: 2, user_id: 2},
  {deck_id: 3, user_id: 2},
  {deck_id: 1, user_id: 2},
  {deck_id: 1, user_id: 1},
  {deck_id: 2, user_id: 1},
  {deck_id: 4, user_id: 1},
  {deck_id: 4, user_id: 1},
  {deck_id: 2, user_id: 1}
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
  {response_text: "true", test_id: 6, card_id: 8},
  {response_text: "Back side test", test_id: 7, card_id: 1},
  {response_text: "Back side test2", test_id: 7, card_id: 2},
  {response_text: "The first president of the USA", test_id: 7, card_id: 3},
  {response_text: "The common crow", test_id: 7, card_id: 4},
  {response_text: "Two weeks", test_id: 7, card_id: 5},
  {response_text: "William Shakespeare", test_id: 7, card_id: 6},
  {response_text: "Candy", test_id: 7, card_id: 7},
  {response_text: "true", test_id: 7, card_id: 8},
  {response_text: "true", test_id: 7, card_id: 17},
  {response_text: "Gold", test_id: 7, card_id: 23},
  {response_text: "2", test_id: 8, card_id: 9},
  {response_text: "Eventing", test_id: 8, card_id: 10},
  {response_text: "false", test_id: 8, card_id: 11},
  {response_text: "Matisse", test_id: 8, card_id: 12},
  {response_text: "Degas", test_id: 8, card_id: 13},
  {response_text: "Degas", test_id: 8, card_id: 14},
  {response_text: "Tolouse-Loutrec", test_id: 8, card_id: 15},
  {response_text: "[\"James\",\"Abbott\",\"McNeill\",\"Whistler\"]", test_id: 8, card_id: 16},
  {response_text: "sea otter", test_id: 9, card_id: 25},
  {response_text: "cuttlefish", test_id: 9, card_id: 26},
  {response_text: "dik dik", test_id: 9, card_id: 27},
  {response_text: "bunny", test_id: 9, card_id: 29},
  {response_text: "bunny", test_id: 10, card_id: 25},
  {response_text: "cuttlefish", test_id: 10, card_id: 26},
  {response_text: "dik dik", test_id: 10, card_id: 27},
  {response_text: "sea otter", test_id: 10, card_id: 29},
  {response_text: "2", test_id: 11, card_id: 9},
  {response_text: "Football", test_id: 11, card_id: 10},
  {response_text: "false", test_id: 11, card_id: 11},
  {response_text: "Matisse", test_id: 11, card_id: 12},
  {response_text: "Manet", test_id: 11, card_id: 13},
  {response_text: "Tolouse-Loutrec", test_id: 11, card_id: 14},
  {response_text: "Manet", test_id: 11, card_id: 15},
  {response_text: "[\"James\",\"Abbott\",\"McNeill\",\"Whistler\"]", test_id: 11, card_id: 16}
])
