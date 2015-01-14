json.(@school, :id, :name, :country, :state, :city)

json.courses @school.courses do |course|
  json.(course, :id, :title, :course_code, :instructor, :school_id)
end
