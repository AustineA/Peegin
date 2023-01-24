# app/views/api/kebe/peegins/show.json.jbuilder
json.peegin do
  json.(@peegin, :title, :synonyms,  :origin, :permalink)
  json.created_at(@peegin.created_at.strftime( "%B %e, %Y"))
   json.meaning @peegin.meaning
  json.example @peegin.example
  json.by @peegin.user.name if @peegin.user.name
  json.author_id @peegin.user.id if @peegin.user
  json.views @peegin.impressionist_count
  json.likes @peegin.get_upvotes.size
  json.voted @voter.voted_for? @peegin if @voter
end
