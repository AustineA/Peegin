# app/views/kebe/peegins/index.json.jbuilder
json.links do
  json.current_page "/api/kebe/peegins?page=#{@peegin.current_page}"
  json.per_page @peegin.per_page
  json.total_entries @peegin.total_entries
  json.next_page "/api/kebe/peegins?page=#{@peegin.next_page}"
  json.previous_page "/api/kebe/peegins?page=#{@peegin.previous_page}"
end



json.peegins @peegin do |peegin|
  json.(peegin, :title, :synonyms, :origin, :permalink)
  json.created_at(peegin.created_at.strftime( "%B %e, %Y"))
  json.meaning peegin.meaning
  json.example peegin.example
  json.by peegin.user.name if peegin.user.name
  json.views peegin.impressionist_count
  json.likes peegin.get_upvotes.size

end
