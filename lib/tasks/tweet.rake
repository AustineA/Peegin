task :tweet => :environment do

	Peegin.clean.sample(1).each do |e|
    $client.update("#{e.title}  peegin.com/#{e.permalink}")
  end

end
