
if @peegins.empty?
  json.message("no record")
else
  json.peegins @peegins do |peegin|
    json.(peegin, :title, :example, :origin, :created_at, :permalink)
    json.meaning(peegin.meaning + " - via peegin.com")

    json.user do
      json.name peegin.user.name
    end

    json.views do
      json.view peegin.impressionist_count
    end

  end
end
