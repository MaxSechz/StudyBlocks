json.(@course, :id, :title, :course_code, :instructor, :school_id)

json.decks @course.decks do |deck|
  json.(deck, :id, :title, :description)
  json.user deck.user, :username
  json.writeable deck.can_write?(current_user)
end
