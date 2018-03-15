task :wordoftheday => :environment do

		Peegin.wod.each{ |e| e.update_attributes(word_of_the_day: false)}
		Peegin.clean.sample(1).each do |e|
      e.update_attributes(word_of_the_day: true)
      $client.update("Word Of  The Day: #{e.title}\n \n #{e.meaning[0..201]}\n \n\ #Peegin #Pidgin #PidginWordOfTheDay \n\n open to see example \n\n peegin.com/#{e.permalink}")
    end

end
