json.(@deck, :id, :title, :user_id, :description, :course_id)

json.cards @deck.cards do |card|
  json.(card, :id, :front, :back, :format, :deck_id)
  json.averageScore card.average_score
  json.image card.image.url(:original) if card.image
end

if @deck.scores
  json.scores @deck.scores
end

if @deck.course
  json.course @deck.course, :id, :title, :course_code, :instructor, :school_id if @deck.course
end
