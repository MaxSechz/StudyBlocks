if @user
  json.(@user, :id, :username, :email)
  json.school @user.school, :id, :name
end
