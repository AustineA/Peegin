task :wordoftheday => :environment do

		Peegin.wod.each{ |e| e.update_attributes(word_of_the_day: false)}
		Peegin.clean.sample(1).each{ |e| e.update_attributes(word_of_the_day: true)}

end
