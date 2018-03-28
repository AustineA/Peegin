# app/views/api/kebe/users/create.json.jbuilder
json.user do
  json.(@user, :name, :email, :authentication_token, :id)
end
