# app/views/peegins/show.json.jbuilder
json.peegin do
  json.(@peegin, :title, :meaning, :example, :origin, :created_at, :permalink)

  json.user do
   json.name @peegin.user.name
  end

  json.views do
    json.view @peegin.impressionist_count
  end

end
