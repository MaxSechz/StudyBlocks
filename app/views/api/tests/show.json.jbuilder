json.(@test, :id, :deck_id, :created_at)

json.deck do
  json.(@deck, :id, :title, :description)
end

json.responses @test.responses do |response|
  json.(response, :id, :response_text, :test_id, :card_id)
  json.card response.card, :id, :front, :back, :format, :deck_id
  json.card do
    json.image response.card.image.url(:thumb) if response.card.image
    json.score response.card.average_score
  end
end
