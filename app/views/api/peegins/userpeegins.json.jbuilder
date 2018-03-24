# app/views/peegins/index.json.jbuilder
json.links do
  json.current_page "/peegins.json?page=#{@all_user_peegin.current_page}"
  json.per_page @all_user_peegin.per_page
  json.total_entries @all_user_peegin.total_entries
  json.next_page "/peegins.json?page=#{@all_user_peegin.next_page}"
  json.previous_page "/peegins.json?page=#{@all_user_peegin.previous_page}"
end



json.peegins @all_user_peegin do |peegin|
  json.(peegin, :title, :meaning, :example, :origin, :created_at, :permalink)

  json.user do
   json.name peegin.user.name
  end

  json.views do
    json.view peegin.impressionist_count
  end

end
