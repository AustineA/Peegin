# app/views/peegins/explore.json.jbuilder

json.trending @trend do |trend|
  json.(trend, :title, :synonyms, :origin, :permalink)
  json.created_at(trend.created_at.strftime( "%B %e, %Y"))
  json.meaning trend.meaning
  json.example trend.example
  json.by trend.user.name if trend.user.name
   json.author_id trend.user.id if trend.user
  json.views trend.impressionist_count
  json.likes trend.get_upvotes.size
  json.voted @voter.voted_for? trend if @voter
end
