# app/views/peegins/index.json.jbuilder
json.peegins @all_user_peegin do |peegin|
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
