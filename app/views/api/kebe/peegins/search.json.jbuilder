# app/views/api/kebe/search/index.json.jbuilder
if @peegins.empty?
  json.message("no record")
else
  json.peegins @peegins do |peegin|
    json.(peegin, :title, :meaning, :example, :origin, :permalink)
    json.created_at(peegin.created_at.strftime( "%B %e, %Y"))

    json.user do
      json.name peegin.user.name
    end

    json.views do
      json.view peegin.impressionist_count
    end

  end
end
