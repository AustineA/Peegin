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
  json.meaning (peegin.meaning.gsub(/(?:\n\r?|\r\n?)/, '<br>'))
  json.example (peegin.example.gsub(/(?:\n\r?|\r\n?)/, '<br>'))

  json.user do
   json.name peegin.user.name
  end

  json.views do
    json.view peegin.impressionist_count
  end

end
