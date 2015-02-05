User.find(3).decks.each do |deck|
  15.times do |time|
    test = deck.tests.create!({ user_id: deck.user.id, created_at: time.days.ago })
    deck.cards.each do |card|
      if card.format == "field"
        response_text = rand.round == 0 ? card.back : "{\"Title\":\"Mona Lisa\"}"
      else
        response_text = rand.round == 0 ? card.back : "Mona Lisa?"
      end
      test.responses.create!({card_id: card.id, response_text: response_text})
    end
  end
end
