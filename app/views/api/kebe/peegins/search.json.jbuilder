# app/views/api/kebe/search/index.json.jbuilder
if @peegins.empty?
  json.message("no record")
else
  json.peegins @peegins do |peegin|
    json.(peegin, :title, :synonyms, :origin, :permalink)
    json.created_at(peegin.created_at.strftime( "%B %e, %Y"))

    json.meaning
    json.example

    json.user do
      json.name peegin.user.name
    end if peegin.user.name

    json.views do
      json.view peegin.impressionist_count
    end

  end
end
