json.(@deck, :id, :title, :user_id, :description, :course_id)

json.cards @deck.cards do |card|
  json.(card, :id, :front, :back, :format, :deck_id)
end


json.course @deck.course, :id, :title, :course_code, :instructor, :school_id if @deck.course
