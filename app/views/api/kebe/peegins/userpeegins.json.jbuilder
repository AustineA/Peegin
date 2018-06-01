# app/views/peegins/index.json.jbuilder
json.peegins @all_user_peegin do |peegin|
  json.(peegin, :title, :synonyms, :origin, :permalink)
  json.created_at(peegin.created_at.strftime( "%B %e, %Y"))
  json.meaning (peegin.meaning.gsub(/(?:\n\r?|\r\n?)/, '<br>'))
  json.example (peegin.example.gsub(/(?:\n\r?|\r\n?)/, '<br>'))

  json.user do
   json.name peegin.user.name
  end

  json.views do
    json.view peegin.impressionist_count
  end

end
