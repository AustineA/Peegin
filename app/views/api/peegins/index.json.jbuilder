# app/views/api/peegins/index.json.jbuilder
json.links do
  json.current_page "/api/peegins?page=#{@peegin.current_page}"
  json.per_page @peegin.per_page
  json.total_entries @peegin.total_entries
  json.next_page "/api/peegins?page=#{@peegin.next_page}"
  json.previous_page "/api/peegins?page=#{@peegin.previous_page}"
end



json.peegins @peegin do |peegin|
  json.(peegin, :title, :meaning, :example, :origin, :created_at, :permalink)

  json.user do
   json.name peegin.user.name
  end

  json.views do
    json.view peegin.impressionist_count
  end

end
