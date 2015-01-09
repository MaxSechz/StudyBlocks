json.(@deck, :id, :title, :user_id, :description, :course_id)

json.cards @deck.cards do |card|
  json.(card, :id, :front, :back, :format, :deck_id)
end
