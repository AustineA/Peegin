task :wordoftheday => :environment do

		Peegin.wod.each{ |e| e.update_attributes(word_of_the_day: false)}
		Peegin.clean.sample(1).each do |e|
      e.update_attributes(word_of_the_day: true)
      $client.update("Word Of  The Day:  #{e.title}  peegin.com/#{e.permalink}")
    end

end
