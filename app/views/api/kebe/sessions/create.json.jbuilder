# app/views/api/kebe/sessions/create.json.jbuilder
json.user do
  json.(@user, :name, :email, :authentication_token, :id)
end