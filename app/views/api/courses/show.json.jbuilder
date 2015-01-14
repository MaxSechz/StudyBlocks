json.(@course, :id, :title, :course_code, :instructor, :school_id)

json.decks @course.decks do |deck|
  json.(deck, :title, :description)
  json.user deck.user, :username
end
