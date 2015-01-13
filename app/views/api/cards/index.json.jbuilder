json.array! @cards do |card|
  json.(card, :id, :front, :back, :format, :deck_id)
  json.averageScore card.average_score
  json.image card.image.url(:original) if card.image
end