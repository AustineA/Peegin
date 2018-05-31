# app/views/peegins/explore.json.jbuilder

json.trending @trend do |trend|
  json.(trend, :title, :synonyms, :origin, :permalink)
  json.created_at(trend.created_at.strftime( "%B %e, %Y"))
  json.meaning (trend.meaning.gsub(/(?:\n\r?|\r\n?)/, '<br>'))
  json.example (trend.example.gsub(/(?:\n\r?|\r\n?)/, '<br>'))

  json.user do
   json.name trend.user.name
  end

  json.views do
    json.view trend.impressionist_count
  end

end
