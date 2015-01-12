json.array! @tests do |test|
  json.(test, :id, :deck_id)
  json.score test.score
  
  json.responses test.responses do |response|
    json.(response, :id, :response_text, :test_id, :card_id)
    json.response response.result
  end
end
