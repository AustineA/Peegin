# app/views/peegins/explore.json.jbuilder

json.trending @trend do |trend|
  json.(trend, :title, :synonyms, :origin, :permalink)
  json.created_at(trend.created_at.strftime( "%B %e, %Y"))
  json.meaning
  json.example
  json.by trend.user.name if trend.user.name
  json.views trend.impressionist_count
  json.likes trend.get_upvotes.size

end
