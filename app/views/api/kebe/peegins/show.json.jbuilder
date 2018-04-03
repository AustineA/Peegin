# app/views/api/kebe/peegins/show.json.jbuilder
json.peegin do
  json.(@peegin, :title, :meaning, :example, :synonyms,  :origin, :permalink)
  json.created_at(@peegin.created_at.strftime( "%B %e, %Y"))

  json.user do
   json.name @peegin.user.name
  end

  json.views do
    json.view @peegin.impressionist_count
  end

end
