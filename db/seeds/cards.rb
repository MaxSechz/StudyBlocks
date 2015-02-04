cards = Card.new([
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
  {front: nil, back: "bunny", format: "choice", deck_id: 5, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 22439, image_updated_at: "2015-01-15 22:52:40"},
  {front: nil, back: "cuttlefish", format: "choice", deck_id: 5, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 397648, image_updated_at: "2015-01-15 22:52:40"},
  {front: nil, back: "dik dik", format: "choice", deck_id: 5, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 28823, image_updated_at: "2015-01-15 22:55:42"},
  {front: nil, back: "painted bunting", format: "choice", deck_id: 5, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 6054452, image_updated_at: "2015-01-15 22:55:42"},
  {front: nil, back: "sea otter", format: "choice", deck_id: 5, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 109996, image_updated_at: "2015-01-15 23:10:12"},
  {front: nil, back: "seal", format: "choice", deck_id: 5, image_file_name: "data", image_content_type: "image/png", image_file_size: 314980, image_updated_at: "2015-01-15 23:41:23"},
  {front: nil, back: "A Sunday afternoon on the Island of La Gran Jatte\nSeurat\n\nPostimpressionism\n\n1885-1900\n\nFrench", format: "response", deck_id: 6, image_file_name: "capture-142E3AC9AD355586BAC.png", image_content_type: "image/png", image_file_size: 1535597, image_updated_at: "2015-01-22 04:19:44"},
  {front: nil, back: "Still life with a Basket of Apples\nCezanne\n\n\nPostimpressionism\n\n1885-1900\n\nFrench", format: "response", deck_id: 6, image_file_name: "capture2-142E3AE0AA462404921.png", image_content_type: "image/png", image_file_size: 1718537, image_updated_at: "2015-01-22 04:19:46"},
  {front: nil, back: "Starry Night\nVan Gogh\n\n\nPostimpressionism\n\n1885-1900\n\nFrench", format: "response", deck_id: 6, image_file_name: "capture3-142E3AE95673B1AC380.png", image_content_type: "image/png", image_file_size: 2095911, image_updated_at: "2015-01-22 04:19:48"},
  {front: nil, back: "Manao Tupapau\nGauguin\n\n\nPostimpressionism\n\n1885-1900\n\nFrench", format: "response", deck_id: 6, image_file_name: "capture1-142E3AEEA940BDEC240.png", image_content_type: "image/png", image_file_size: 1716846, image_updated_at: "2015-01-22 04:19:49"},
  {front: nil, back: "Unique Forms of Continuity in Space\nBoccioni\n\nFuturism\n\nItalian\n\n1910-1930", format: "response", deck_id: 6, image_file_name: "captur7e-142E3B004302530C759.png", image_content_type: "image/png", image_file_size: 785141, image_updated_at: "2015-01-22 04:19:50"},
  {front: nil, back: "Red-Blue chair\nRietveld\n\nDe Stijl\n\nDutch\n\n 1910-1930", format: "response", deck_id: 6, image_file_name: "capture8-142E3B0CC26403A8CBA.png", image_content_type: "image/png", image_file_size: 453425, image_updated_at: "2015-01-22 04:19:51"},
  {front: nil, back: "Bauhaus\nGropius\n\nModernism\n\nGerman\n\n 1910-1930", format: "response", deck_id: 6, image_file_name: "captur8e-142E3B15DC360216771.png", image_content_type: "image/png", image_file_size: 1012188, image_updated_at: "2015-01-22 04:19:52"},
  {front: nil, back: "Detroit industry\nRivera\n\nMuralism\n\nMexican\n\n 1910-1930", format: "response", deck_id: 6, image_file_name: "capture9-142E3B1F18F49C230B1.png", image_content_type: "image/png", image_file_size: 1504698, image_updated_at: "2015-01-22 04:19:53"},
  {front: nil, back: "Joy of Life\nMatisse\n\nFauvism\n\nFrench\n\nc. 1910", format: "response", deck_id: 6, image_file_name: "capture6-142E3B486536A8202F4.png", image_content_type: "image/png", image_file_size: 1830802, image_updated_at: "2015-01-22 04:19:54"},
  {front: nil, back: "Demoiselles d'Avignon\nPicasso\n\nCubism\n\nFrench/Spanish\n\n c. 1910", format: "response", deck_id: 6, image_file_name: "capture7-142E3B5095A7C4F883D.png", image_content_type: "image/png", image_file_size: 2815479, image_updated_at: "2015-01-22 04:19:55"},
  {front: nil, back: "Street, Berlin\nKirchner\n\nExpressionism\n\nGerman\n\n c. 1910", format: "response", deck_id: 6, image_file_name: "capture4-142E3B5C9E933A1CBCA.png", image_content_type: "image/png", image_file_size: 2017258, image_updated_at: "2015-01-22 04:19:56"},
  {front: nil, back: "Self-Portrait\nModersohn-Becker\n\nExpressionism\n\nGerman\n\n c. 1910", format: "response", deck_id: 6, image_file_name: "capture5-142E3B6443569BC50D0.png", image_content_type: "image/png", image_file_size: 1854851, image_updated_at: "2015-01-22 04:19:58"},
  {front: nil, back: "Fountain\nDuchamp\n\nDada\n\nFrench/American\n\n1910-1930", format: "response", deck_id: 6, image_file_name: "cap3ture-142E3B774364AFF2F95.png", image_content_type: "image/png", image_file_size: 1441287, image_updated_at: "2015-01-22 04:19:59"},
  {front: nil, back: "War Cripples Playing Cards\nDix\n\nDada\n\nGerman\n\n1910-1930", format: "response", deck_id: 6, image_file_name: "ca1pture-142E3B844832E7F355B.png", image_content_type: "image/png", image_file_size: 308035, image_updated_at: "2015-01-22 04:20:00"},
  {front: nil, back: "The persistence of Memory\nDali\n\nSpanish\n\nSurrealism\n\n1920-1945", format: "response", deck_id: 6, image_file_name: "7capture-142E3B8E8DF6892488A.png", image_content_type: "image/png", image_file_size: 732731, image_updated_at: "2015-01-22 04:20:00"},
  {front: nil, back: "The treachery of Images\nMagritte\n\nBelgian\n\n\nSurrealism\n\n1920-1945", format: "response", deck_id: 6, image_file_name: "ca6pture-142E3B9846F64ADD91B.png", image_content_type: "image/png", image_file_size: 926670, image_updated_at: "2015-01-22 04:20:01"},
  {front: nil, back: "Object\nOppenheim\n\nSwiss\n\n\nSurrealism\n\n1920-1945", format: "response", deck_id: 6, image_file_name: "ca14pture-142E3BA10BD19DC9DAA.png", image_content_type: "image/png", image_file_size: 840756, image_updated_at: "2015-01-22 04:20:02"},
  {front: nil, back: "The Seagram Building\nMies van der Rohe\n\nInternational Style Architecture\n\n1945-1960\n\nAmerican", format: "response", deck_id: 6, image_file_name: "ca12pture-142E3BA83072EF63367.png", image_content_type: "image/png", image_file_size: 1181407, image_updated_at: "2015-01-22 04:20:03"},
  {front: nil, back: "The Farnsworth House\n\nMies van der Rohe\n\nInternational Style Architecture\n\n1945-1960\n\nAmerican", format: "response", deck_id: 6, image_file_name: "captur55e-142E3BB5CCD48161136.png", image_content_type: "image/png", image_file_size: 1649780, image_updated_at: "2015-01-22 04:20:04"},
  {front: nil, back: "Number 1\nPollock\n\nAbstract Expressionism\n\nAmerican\n\n1945-1960", format: "response", deck_id: 6, image_file_name: "cap33ture-142E3BBDF003B624809.png", image_content_type: "image/png", image_file_size: 1884978, image_updated_at: "2015-01-22 04:20:06"},
  {front: nil, back: "Number 10\nRothko\n\n\nAbstract Expressionism\n\nAmerican\n\n1945-1960", format: "response", deck_id: 6, image_file_name: "capt1234ure-142E3BCA86D566172F5.png", image_content_type: "image/png", image_file_size: 1044916, image_updated_at: "2015-01-22 04:20:07"},
  {front: nil, back: "Marilyn Monroe Dyptich\nWarhol\n\nPostmodernism\n\nAmerican\n\n1960-Present", format: "response", deck_id: 6, image_file_name: "c34apture-142E3BD48580A58F101.png", image_content_type: "image/png", image_file_size: 1559238, image_updated_at: "2015-01-22 04:20:08"},
  {front: nil, back: "The Dinner Party\nChicago\n\n\nPostmodernism\n\nAmerican\n\n1960-Present", format: "response", deck_id: 6, image_file_name: "captur567e-142E3BF47163B0BAF28.png", image_content_type: "image/png", image_file_size: 1343387, image_updated_at: "2015-01-22 04:20:09"},
  {front: nil, back: "Rabbit\nKoons\n\n\nPostmodernism\n\nAmerican\n\n1960-Present", format: "response", deck_id: 6, image_file_name: "captutgre-142E3BFEAA815CF6812.png", image_content_type: "image/png", image_file_size: 741497, image_updated_at: "2015-01-22 04:20:10"},
  {front: nil, back: "Parthenon\nGreek\n\nClassical\n\n450-320 BC", format: "response", deck_id: 6, image_file_name: "parth-142E3DF0D6606FB1D00.png", image_content_type: "image/png", image_file_size: 1234339, image_updated_at: "2015-01-22 04:20:11"},
  {front: nil, back: "The Riace Warriors\nGreek\n\nEarly Classical\n\n480-450 BC", format: "response", deck_id: 6, image_file_name: "riace-142E3DF40EB1F523E04.png", image_content_type: "image/png", image_file_size: 717935, image_updated_at: "2015-01-22 04:20:12"},
  {front: nil, back: "The Pantheon\nRoman\n\nEmpire\n\n27-200 CE", format: "response", deck_id: 6, image_file_name: "pantheon-142E3DF8C536D40EE0D.png", image_content_type: "image/png", image_file_size: 1366757, image_updated_at: "2015-01-22 04:20:13"},
  {front: nil, back: "The Arch of Constantine Oration\nRoman\n\nLate Empire\n\n200-476 CE", format: "response", deck_id: 6, image_file_name: "oratio-142E3E0069446B6B0F5.png", image_content_type: "image/png", image_file_size: 492458, image_updated_at: "2015-01-22 04:20:14"},
  {front: nil, back: "The Arch of constantine Donation\nRoman\n\nLate empire\n\n200-476 CE", format: "response", deck_id: 6, image_file_name: "donatio-142E3E0302168CBCA10.png", image_content_type: "image/png", image_file_size: 490257, image_updated_at: "2015-01-22 04:20:14"},
  {front: nil, back: "The Church of San Vitale\nRavenna\n\nByzantine\n\n500-1453 CE", format: "response", deck_id: 6, image_file_name: "vitale-142E3E06CD41FF4A180.png", image_content_type: "image/png", image_file_size: 1343309, image_updated_at: "2015-01-22 04:20:15"},
  {front: nil, back: "The Church of San Vitale - Justinian and his attendants \nRavenna\n\nByzantine\n\n500-1453 CE", format: "response", deck_id: 6, image_file_name: "justinianvitale-142E3E09764551EEB7D.png", image_content_type: "image/png", image_file_size: 2381205, image_updated_at: "2015-01-22 04:20:16"},
  {front: nil, back: "Hildesheim Doors\nCommissioned by Bishop Bernward\n\nOttonian\n\nc. 1000", format: "response", deck_id: 6, image_file_name: "hildies-142E3E0CEEC1EC17D3D.png", image_content_type: "image/png", image_file_size: 1708540, image_updated_at: "2015-01-22 04:20:18"},
  {front: nil, back: "Last Judgement Tympanum\nAbbey and Pilgrinage Church of Conques\n\nRomanesque\n\n1000-1200\n\nFrench", format: "response", deck_id: 6, image_file_name: "abbeychurch-142E3E0E8142193FA3B.png", image_content_type: "image/png", image_file_size: 1605077, image_updated_at: "2015-01-22 04:20:19"},
  {front: nil, back: "Cathedral of Notre Dame at Chartres\nGothic\n\n1140-1500\n\nFrench", format: "response", deck_id: 6, image_file_name: "chartes-142E3E11E3F512F87E8.png", image_content_type: "image/png", image_file_size: 1502116, image_updated_at: "2015-01-22 04:20:21"},
  {front: nil, back: "Birth of Venus\nBotticelli\n\nEarly Renaissance\n\n1300-1500\n\nItalian", format: "response", deck_id: 6, image_file_name: "venus-142E3E14E8C4871D587.png", image_content_type: "image/png", image_file_size: 1519682, image_updated_at: "2015-01-22 04:20:22"},
  {front: nil, back: "Self-Portrait\nDurer\n\nRenaissance\n\n1490-1525\n\nGerman", format: "response", deck_id: 6, image_file_name: "durer-142E3E16C790C0C610B.png", image_content_type: "image/png", image_file_size: 957237, image_updated_at: "2015-01-22 04:20:23"},
  {front: nil, back: "School of Athens\nRaphael\n\nRenaissance\n\n1490-1525\n\nItalian", format: "response", deck_id: 6, image_file_name: "athens-142E3E1881D24756F38.png", image_content_type: "image/png", image_file_size: 1251841, image_updated_at: "2015-01-22 04:20:24"},
  {front: nil, back: "Venus of Urbino\nTitian\n\nLate renaissance\n\n1525-1600\n\nItalian", format: "response", deck_id: 6, image_file_name: "urbinpo-142E3E1B31B3C50A74E.png", image_content_type: "image/png", image_file_size: 1314938, image_updated_at: "2015-01-22 04:20:25"},
  {front: nil, back: "St Peters Bassilica\nBernini\n\nBaroque\n\n1600-1700\n\nItalian", format: "response", deck_id: 6, image_file_name: "peter-142E3E1E25F4BCC6049.png", image_content_type: "image/png", image_file_size: 1483307, image_updated_at: "2015-01-22 04:20:26"},
  {front: nil, back: "Baldacchino -  St Peters Bassilica \nBernini\n\nBaroque\n\n1600-1700\n\nItalian", format: "response", deck_id: 6, image_file_name: "bald-142E433427B3F4A0A4B.png", image_content_type: "image/png", image_file_size: 1898082, image_updated_at: "2015-01-22 04:20:28"},
  {front: nil, back: "Chair of  St Peters Bassilica \nBernini\n\nBaroque\n\n1600-1700\n\nItalian", format: "response", deck_id: 6, image_file_name: "throne-142E3E21B2759F33FDB.png", image_content_type: "image/png", image_file_size: 1923553, image_updated_at: "2015-01-22 04:20:29"},
  {front: nil, back: "The anatomy Lesson of Dr. Kulp\nRembrandt\n\nBaroque\n\n1600-1700\n\nDutch", format: "response", deck_id: 6, image_file_name: "captremure-142E3E2537661995AE5.png", image_content_type: "image/png", image_file_size: 1241087, image_updated_at: "2015-01-22 04:20:30"},
  {front: nil, back: "The Swing\nFragonard\n\nRococo\n\n1700-1780\n\nFrench", format: "response", deck_id: 6, image_file_name: "swinf-142E3E276D54FDAD869.png", image_content_type: "image/png", image_file_size: 2039576, image_updated_at: "2015-01-22 04:20:31"},
  {front: nil, back: "Philosopher giving a Lecture on an Orrery\nWright of Derby\n\nRomanticism\n\n1750-1840\n\nBritish", format: "response", deck_id: 6, image_file_name: "philo-142E3E2B9B51782E7CA.png", image_content_type: "image/png", image_file_size: 879366, image_updated_at: "2015-01-22 04:20:32"},
  {front: nil, back: "Oath of the Horatii\nDavid\n\nNeoclassicism\n\n1750-1840\n\nFrench", format: "response", deck_id: 6, image_file_name: "oatjh-142E3E2E5405FA7668A.png", image_content_type: "image/png", image_file_size: 1407801, image_updated_at: "2015-01-22 04:20:33"},
  {front: nil, back: "Executions of the 3rd of May, 1808\nGoya\n\nRomanticism\n\nSpanish\n\n1750-1840", format: "response", deck_id: 6, image_file_name: "goya-142E3E309254A9A5DB5.png", image_content_type: "image/png", image_file_size: 1479296, image_updated_at: "2015-01-22 04:20:34"},
  {front: nil, back: "The Crystal Palace\nPaxton\n\nModern Architecture\n\nc. 1850\n\nBritish", format: "response", deck_id: 6, image_file_name: "pax-142E3E32A420725D0B6.png", image_content_type: "image/png", image_file_size: 1220662, image_updated_at: "2015-01-22 04:20:35"},
  {front: nil, back: "Bar at the Folies-Bergere\nManet\n\nImpressionism\n\n1865-1890\n\nFrench", format: "response", deck_id: 6, image_file_name: "folies-142E3E359263213E617.png", image_content_type: "image/png", image_file_size: 1841352, image_updated_at: "2015-01-22 04:20:37"},
  {front: nil, back: "The Golden Stairs\nBurne-Jones\n\nAesthetic Movement\n\n1860-1890\n\nBritish", format: "response", deck_id: 6, image_file_name: "bunre-142E3E3A6FE6B88EA81.png", image_content_type: "image/png", image_file_size: 1203243, image_updated_at: "2015-01-22 04:20:39"},
  {front: nil, back: "Birth of Athena - Parthenon\nGreek\n\nClassical\n\n450-320 BC", format: "response", deck_id: 6, image_file_name: "birf-142E3E4CEE278BF4C1E.png", image_content_type: "image/png", image_file_size: 455269, image_updated_at: "2015-01-22 04:20:39"},
  {front: nil, back: "Emperor Panel\nCentral Binyang Cave\n\nLongmen\n\n523 CE", format: "response", deck_id: 7, image_file_name: "longmen_central_binyang_cave_emperor_panel-142E34B9FA043C51637.jpg", image_content_type: "image/jpeg", image_file_size: 189697, image_updated_at: "2015-01-28 16:20:57"},
  {front: nil, back: "The Wei Empress & Court Ladies\nlimestone\n\nCentral Binyang cave\n\nLongmen\n\n523 CE", format: "response", deck_id: 7, image_file_name: "longmen_central_binyang_cave_empress_panel-142E34D17BE2ED9891F.jpg", image_content_type: "image/jpeg", image_file_size: 148652, image_updated_at: "2015-01-28 16:21:00"},
  {front: nil, back: "Seated Buddha\nCentral Binyang Cave\n\nLongmen\n\n523 CE", format: "response", deck_id: 7, image_file_name: "longmen_central_binyang_cave_seated_buddha-142E34E403A71CB67FE.jpg", image_content_type: "image/jpeg", image_file_size: 224936, image_updated_at: "2015-01-28 16:21:01"},
  {front: nil, back: "Standing Buddha & Boddhisatvas\nCentral Binyang Cave\n\nLongmen\n\n523 CE", format: "response", deck_id: 7, image_file_name: "longmen_central_binyang_cave_standing_buddha___bodhisattvas-142E34F539824583458.jpg", image_content_type: "image/jpeg", image_file_size: 282637, image_updated_at: "2015-01-28 16:21:02"},
  {front: nil, back: "Sakyamuni Buddha\nGilt Bronze\n\nLater Zhao\n\n338 CE", format: "response", deck_id: 7, image_file_name: "seated_buddha_n_wei_338-142E35078AD67FD2A27.jpg", image_content_type: "image/jpeg", image_file_size: 160210, image_updated_at: "2015-01-28 16:21:02"},
  {front: nil, back: "Shakyamuni & Prabhutaratna\nN Wei\n\n518 CE", format: "response", deck_id: 7, image_file_name: "shakyamuni___prabhutaratna_n_wei_518-142E35506156C65EF11.jpg", image_content_type: "image/jpeg", image_file_size: 212957, image_updated_at: "2015-01-28 16:21:03"},
  {front: nil, back: "Standing Guanyin\nEarly Sui\n\nfrom qinglonsi, Xian\n\nC 550-577 AD", format: "response", deck_id: 7, image_file_name: "standing_guanyin_early_sui-142E3561A634F64E10C.jpg", image_content_type: "image/jpeg", image_file_size: 134199, image_updated_at: "2015-01-28 16:21:04"},
  {front: nil, back: "Standing Guanyin\nN Qi\n\n550-577 CE", format: "response", deck_id: 7, image_file_name: "standing_guanyin_n_qi__detail_of_head-142E35884482429D185.jpg", image_content_type: "image/jpeg", image_file_size: 49034, image_updated_at: "2015-01-28 16:21:04"},
  {front: nil, back: "Seated Buddha\nN Wei\n\nShanxi\n\nYungang Cave XX\n\n460-470 CE", format: "response", deck_id: 7, image_file_name: "yungang_cave_20_seated_buddha-142E35AEB07207D7899.jpg", image_content_type: "image/jpeg", image_file_size: 170819, image_updated_at: "2015-01-28 16:21:05"},
  {front: nil, back: "Standing Buddha\nYungang Cave VI\n\nShanxi\n\n480 - 490 CE", format: "response", deck_id: 7, image_file_name: "yungang_cave_vi_standing_buddha_detail-142E35CFC25436F6A24.jpg", image_content_type: "image/jpeg", image_file_size: 191027, image_updated_at: "2015-01-28 16:21:06"},
  {front: nil, back: "Bodhisattva of friar bala\nRed sandstone\n\nfrom Mathura\n\nc 123 CE", format: "response", deck_id: 7, image_file_name: "bodhisattva_of_friar_bala-142E336E1527AE97231.jpg", image_content_type: "image/jpeg", image_file_size: 77988, image_updated_at: "2015-01-28 16:21:06"},
  {front: nil, back: "Chaitya at Karle\n2nd CE", format: "response", deck_id: 7, image_file_name: "chaitya_at_karle_facade-142E337D8983E31750A.jpg", image_content_type: "image/jpeg", image_file_size: 128908, image_updated_at: "2015-01-28 16:21:07"},
  {front: nil, back: "Colossal Buddha at Bamiyan\n554 CE", format: "response", deck_id: 7, image_file_name: "colossal_buddha_bamiyan-142E33A2C5A10A5C751.jpg", image_content_type: "image/jpeg", image_file_size: 180603, image_updated_at: "2015-01-28 16:21:07"},
  {front: nil, back: "East Torana of Stupa mound at Sanchi\n3rd BCE - 1st CE", format: "response", deck_id: 7, image_file_name: "east_torana_stupa_at_sanchi-142E33E48A342EAC7FC.jpg", image_content_type: "image/jpeg", image_file_size: 135018, image_updated_at: "2015-01-28 16:21:08"},
  {front: nil, back: "Great Stupa mound at Sanchi\n3rd BCE - 1st CE", format: "response", deck_id: 7, image_file_name: "great_stupa_at_sanchi-142E33F40E8716EE545.jpg", image_content_type: "image/jpeg", image_file_size: 143319, image_updated_at: "2015-01-28 16:21:08"},
  {front: nil, back: "King Kanishka\nSandstone\n\nfrom Mathura\n\nc 120 CE", format: "response", deck_id: 7, image_file_name: "king_kanishka_torso-142E33FB04A76468920.jpg", image_content_type: "image/jpeg", image_file_size: 139436, image_updated_at: "2015-01-28 16:21:09"},
  {front: nil, back: "Parkham YakshaSandstone\nfrom Mathura\n2nd BCE", format: "response", deck_id: 7, image_file_name: "parkham_yaksa_figure-142E34053975079ED67.jpg", image_content_type: "image/jpeg", image_file_size: 90739, image_updated_at: "2015-01-28 16:21:09"},
  {front: nil, back: "Seated Buddha\nfrom Gandhara\n\ngray granite\n\n3rd - 5th CE", format: "response", deck_id: 7, image_file_name: "seated_buddha_gandhara-142E3411C4559315C58.jpg", image_content_type: "image/jpeg", image_file_size: 156874, image_updated_at: "2015-01-28 16:21:10"},
  {front: nil, back: "The First Sermon\nguptan period\n\n5th CE\n\ncreamy sandstone\n\nfrom Sarnath", format: "response", deck_id: 7, image_file_name: "seated_buddha_guptan-142E342F3B37C872A71.jpg", image_content_type: "image/jpeg", image_file_size: 139528, image_updated_at: "2015-01-28 16:21:11"},
  {front: nil, back: "Seated Buddha beneath the Bodhi tree\nfrom Mathura\n\nred sandstone\n\n1st - 2nd CE", format: "response", deck_id: 7, image_file_name: "seated_buddha_mathura-142E3453BFA39BD3674.jpg", image_content_type: "image/jpeg", image_file_size: 152924, image_updated_at: "2015-01-28 16:21:11"},
  {front: nil, back: "Standing Buddha\nred sandstone\n\nfrom mathura\n\nguptan period\n\n4th - 5th CE", format: "response", deck_id: 7, image_file_name: "standing_buddha_guptan-142E34763CE10E36CCE.jpg", image_content_type: "image/jpeg", image_file_size: 112570, image_updated_at: "2015-01-28 16:21:12"},
  {front: nil, back: "Yakshi East Torana at Sanchi\n3rd BCE - 1st CE", format: "response", deck_id: 7, image_file_name: "yakshi_east_torana_sanchi-142E34817E467B1FF6A.jpg", image_content_type: "image/jpeg", image_file_size: 154252, image_updated_at: "2015-01-28 16:21:12"},
  {front: nil, back: "Wintry groves & layered banks\nby Dong Yuan\n\nink and colors on silk\n\n962 CE\n\n5 dynasties period", format: "response", deck_id: 7, image_file_name: "dong_yuan_wintry_groves___layered_banks-142E3655F21540FA7A0.jpg", image_content_type: "image/jpeg", image_file_size: 204689, image_updated_at: "2015-01-28 16:21:13"},
  {front: nil, back: "Travelers amid mountains & streams\nby Fan Kuan\n\nc 1000\n\nhanging scroll, ink on silk\n\n\nN Song dynasty", format: "response", deck_id: 7, image_file_name: "fan_kuan_travelers_among_streams_and_mountains-142E3EB7DA77CD19CB4.jpg", image_content_type: "image/jpeg", image_file_size: 136787, image_updated_at: "2015-01-28 16:21:13"},
  {front: nil, back: "Early Spring\nby Guo Xi\n\nc 1072\n\nhanging scroll, ink on silk\n\nN Song Dynasty", format: "response", deck_id: 7, image_file_name: "guo_xi__early_spring__n_song__1072-142E368C830052397EF.jpg", image_content_type: "image/jpeg", image_file_size: 293702, image_updated_at: "2015-01-28 16:21:14"},
  {front: nil, back: "Winter Landscape\nby Jing Hao\n\nhanging scroll, ink and slight color on silk\n\n10th CE\n\n5 dynasties period", format: "response", deck_id: 7, image_file_name: "jing_hao_winter_landscape_full_view-142E369AA824F01865F.jpg", image_content_type: "image/jpeg", image_file_size: 110602, image_updated_at: "2015-01-28 16:21:15"},
  {front: nil, back: "Waiting in the hills for a weiqi partner\nfrom a tomb in Liaoning province\n\n959-986 CE\n\nhanging scroll, ink and colors on silk\n\n5 dynasties period", format: "response", deck_id: 7, image_file_name: "liaoning_tomb_ptg_waiting_for_a_weiqi_partner_silk-142E36AC9D20710EC45.jpg", image_content_type: "image/jpeg", image_file_size: 141530, image_updated_at: "2015-01-28 16:21:15"},
  {front: nil, back: "Musicians on an Elephant\nPainterly Style\n\nmineral colors on leather\n\non a biwa\n\n8th CE\n\nShosoin, Nara", format: "response", deck_id: 7, image_file_name: "musicians_on_an_elephant-142E36C77AE77AF83ED.jpg", image_content_type: "image/jpeg", image_file_size: 156626, image_updated_at: "2015-01-28 16:21:16"},
  {front: nil, back: "Illustration to the lotus sutra\nwall painting from cave 103\n\nDunhuang\n\nTang dynasty\n\n700-750 CE\n\nLinear style", format: "response", deck_id: 7, image_file_name: "tang_landscape_ptg_dunhuang_cave_103_illustration_to_lotus_sutra_linear_style-142E36EB8A1380C5926.jpg", image_content_type: "image/jpeg", image_file_size: 156938, image_updated_at: "2015-01-28 16:21:17"},
  {front: nil, back: "Illustration to the lotus Sutra\nwall painting from cave 217\n\nDunhuang\n\nTang Dynasty\n\n8th CE\n\nBoneless Style", format: "response", deck_id: 7, image_file_name: "tang_landscape_ptg_dunhuangcave_217_illustration_to_lotus_sutra_boneless_style-142E370FE795DE208DD.jpg", image_content_type: "image/jpeg", image_file_size: 149179, image_updated_at: "2015-01-28 16:21:17"},
  {front: nil, back: "Travelers in spring\n attributed to Zhan Ziqian\n\n\nLinear style\n\nHandscroll, ink & color on silk\n\nTang Dyansty\n\n1st half of Tang style", format: "response", deck_id: 7, image_file_name: "zhan_ziqian_(attrib)__travelers_in_a_spring_landscape-142E3715F1758EF33DD.jpg", image_content_type: "image/jpeg", image_file_size: 283859, image_updated_at: "2015-01-28 16:21:18"},
  {front: nil, back: "Naiku at Ise\nc 5th century", format: "response", deck_id: 7, image_file_name: "ise_aerial_viewnaiku-142E35FB93E7612E746.jpg", image_content_type: "image/jpeg", image_file_size: 300171, image_updated_at: "2015-01-28 16:21:19"},
  {front: nil, back: "Horyuji\nIkaruga, Nara\n\n7th century CE", format: "response", deck_id: 7, image_file_name: "horyuji_aerial_view_layout-142E361B97B71E5D215.jpg", image_content_type: "image/jpeg", image_file_size: 131074, image_updated_at: "2015-01-28 16:21:19"},
  {front: nil, back: "Shaka triadby Shiba Tori\nBronze\n623 CE", format: "response", deck_id: 7, image_file_name: "shaka_triad-142E36419C73381282C.jpg", image_content_type: "image/jpeg", image_file_size: 109933, image_updated_at: "2015-01-28 16:21:20"},
  {front: "Asymmetric Information", back: "Situation in which a buyer and a seller possess different information about a transaction", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "The Lemons Problem", back: "With asymmetric information, low quality goods can drive high quality goods out of the market.", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Adverse Selection", back: "Form of market failure resulting when products of different qualities are sold at a single price because of asymmetric information, so that too much of the low-quality product and too little of the high-quality product are sold.", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Market Signaling", back: "Process by which sellers send signals to buyers conveying information about product quality.\r\nex. Education, USEF show records", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Moral Hazard", back: "When a party whose actions are unobserved can affect the probability or magnitude of a payment associated with an event.\r\nex. if you have insurance on a car, you are less likely to care what happens to it because the insurance will cover it.\r\n\r\n When one person takes more  risks  because someone else has agreed to bear the burden of those risks.", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Principal-agent Problem", back: "Problem arising when agents (e.g., a firm's managers) pursue their own goals rather than the goals of principals (e.g., the firm's owners).", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Agent", back: "Individual employed by a principal to achieve the principal's objective", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Principal", back: "Individual who employs one or more agents to achieve an objective.", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Efficiency wage theory", back: "Explanation for the presence of unemployment and wage discrimination which recognizes that labor productivity may be affected by the wage rate.", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Shirking model", back: "Principle that workers still have an incentive to shirk of a firm pays them a market-clearing wage, because fired workers can be hired somewhere else for the same wage", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Efficiency wage", back: "Wage that a firm will pay to an employee as an incentive not to shirk", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Externality", back: "Action by either a producer or a consumer which affects other producers or consumers, but is not accounted for in the market price\r\nExternalities can be negative, when the action of one party imposes costs on another party, or positive, when the action of one party benefits another party.", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Marginal External Cost", back: "Increase in cost imposed externally as one or more firms increase output by one unit", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Marginal Social Cost", back: "Sum of the marginal cost of production and the marginal external cost", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "External Cost\r\n(Negative externalities)", back: "https://s3.amazonaws.com/classconnection/726/flashcards/7026726/png/screen_shot_2014-12-09_at_123627_am-14A2D8D4459232BFF75.png", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "External cost with downward sloping demand", back: "https://s3.amazonaws.com/classconnection/726/flashcards/7026726/png/screen_shot_2014-12-09_at_123756_am-14A2D8EDB1C287A9B40.png", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Marginal External Benefit", back: "Increased benefit that accuses to other parties as a firm increases output by one unit", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Marginal Social Benefit", back: "Sum of the marginal private benefit plus the marginal external benefit", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Emission Standard", back: "Legal limit on the amount of pollutants that a firm can emit", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Emissions Fee", back: "Charge levied on each unit of a firm's emissions", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Coase Theorem", back: "Principle that when parties can bargain without cost and to their mutual advantage, the resulting outcome will be efficient regardless of how property rights are specified", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Public Good", back: "Nonexclusive and nonrival good: the marginal cost of provision to an additional consumer is zero and people cannot be excluded from consuming it", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Nonrival good", back: "Good for which the marginal cost of its provision to an additional consumer is zero\r\nex. Just because you're using it, it doesn't mean other people can't use it also", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Nonexclusive good", back: "Good that people cannot be excluded from consuming, so that it is difficult or impossible to charge for its use\r\nex. can't prevent people who haven't paid from consuming it", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Examples of Different Goods", back: "https://s3.amazonaws.com/classconnection/726/flashcards/7026726/png/screen_shot_2014-12-09_at_125003_am-14A2D9939DD3D6707EA.png", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Free Rider", back: "Consumer or producer who does not pay for a nonexlusive good in the expectation that others will\r\nex. free wifi, using people's Netflix passwords", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Third Person Criterion", back: "The convention that says that an activity should be considered to be production (rather than leisure) if a person could buy a market replacement or pay someone else to do the activity in his or her place.", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Opportunity Cost", back: "Monetary value given by how much income is forgone by the household member when performing a specific task", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil},
  {front: "Replacement Cost", back: "The monetary value equals cost of paying other person to do the housework (generalist vs special wage method)", format: "response", deck_id: 4, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil}
])

cards.save(validate: false)
