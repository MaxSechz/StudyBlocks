json.(@test, :id, :deck_id)

json.responses @test.responses do |response|
  json.(response, :id, :response_text, :test_id, :card_id)
end
