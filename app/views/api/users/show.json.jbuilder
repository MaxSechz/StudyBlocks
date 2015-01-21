if @user
  json.(@user, :id, :username, :email)
  if @user.school
    json.school @user.school, :id, :name
  end
end
