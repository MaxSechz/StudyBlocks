json.(@deck, :title, :user_di, :description, :course_id)

json.cards @deck.cards do |card|
  json.(card, :front, :back, :format, :deck_id)
end
