# app/views/search/index.json.jbuilder
if @peegins.empty?
  json.message("no record")
else
  json.peegins @peegins do |peegin|
    json.(peegin, :title, :meaning, :example, :origin, :created_at, :permalink)

    json.user do
      json.name peegin.user.name
    end

    json.views do
      json.view peegin.impressionist_count
    end

  end
end