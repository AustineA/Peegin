# app/views/peegins/index.json.jbuilder
json.links do
  json.current_page "/peegins.json?page=#{@peegin.current_page}"
  json.per_page @peegin.per_page
  json.total_entries @peegin.total_entries
  json.next_page "/peegins.json?page=#{@peegin.next_page}"
  json.previous_page "/peegins.json?page=#{@peegin.previous_page}"
end



json.peegins @peegin do |peegin|
  json.(peegin, :title, :meaning, :example, :created_at)

  json.user do
   json.name peegin.user.name
  end

  json.views do
    json.view peegin.impressionist_count
  end

end
