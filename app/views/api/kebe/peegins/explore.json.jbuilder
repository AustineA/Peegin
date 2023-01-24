# app/views/peegins/explore.json.jbuilder

json.trending @trend do |trend|
  json.(trend, :title, :synonyms, :origin, :permalink)
  json.created_at(trend.created_at.strftime( "%B %e, %Y"))
  json.meaning
  json.example

  json.user do
   json.name trend.user.name
  end if trend.user.name

  json.views do
    json.view trend.hits
  end

end
