# app/views/kebe/peegins/index.json.jbuilder
json.peegins @peegin do |peegin|
  json.(peegin, :title, :meaning, :example, :origin, :created_at, :permalink)

  json.user do
   json.name peegin.user.name
  end

  json.views do
    json.view peegin.impressionist_count
  end

end
