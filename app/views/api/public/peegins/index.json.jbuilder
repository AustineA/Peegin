
json.links do
  json.current_page "/peegins/udo?page=#{@peegin.current_page}"
  json.per_page @peegin.per_page
  json.next_page "/peegin/udo?page=#{@peegin.next_page}"
  json.previous_page "/peegins/udo?page=#{@peegin.previous_page}"
end


json.peegins @peegin do |peegin|
  json.(peegin, :title, :example, :origin, :created_at, :permalink)
  json.meaning(peegin.meaning + " - via peegin.com")

  json.user do
   json.name peegin.user.name
  end

  json.views do
    json.view peegin.impressionist_count
  end

end
