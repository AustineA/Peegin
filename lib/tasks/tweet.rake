task :tweet => :environment do

	Peegin.clean.sample(1).each do |e|
    $client.update("#{e.title}:\n \n #{e.meaning[0..201]} \n \n #Peegin #Pidgin \n\n peegin.com/#{e.permalink}")
  end

end
