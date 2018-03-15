
namespace :search do
  task :pidgin => :environment do
      replies = [" …Speaking about pidgin, you can learn new pidgin slangs and words from peegin.com or better still, get the mobile app here https://play.google.com/store/apps/details?id=net.amaniart.peegin", "Did you know that pidgin is becoming a very popular language in Africa? Well, now you know you owe us a favour. Learn new pidgin words via peegin.com and you can thank us later", "Nice tweet, you should check out our online Pidgin English dictionary via peegin.com and learn more. There’s a lot you can learn.", "We can see you see us… You should check out our Pidgin English dictionary via peegin.com and also download our android app via https://play.google.com/store/apps/details?id=net.amaniart.peegin"]

    $client.search("Pidgin", result_type: "recent").take(5).each do |tweet|
      handle = tweet.user.screen_name
      handle_name = tweet.user.name.downcase


      if handle_name.include? "peegin"

      elsif handle_name.include? "pidgin"

      else
        $client.update("@#{handle} #{replies.sample}", in_reply_to_status_id: tweet.id)
        sleep(1)
      end


      # puts "#{handle_name}: #{tweet.text} #{tweet.id} \n \n \n #{replies.sample}"
      # sleep(1)
      # puts "Sleeping"
    end
  end

  task :slang => :environment do

    replies = ["We see say u sabi pidgin, but we sabi pass you.. Come see wetin we get for our pidgin dictionary wey dey for peegin.com", "You feel say you sabi yan pidgin pass us? Try us na, come see de kin slangs we get for peegin.com or download our fone app from playstore https://play.google.com/store/apps/details?id=net.amaniart.peegin", "See more pidgin words for inside peegin.com or download our fone app from playstore https://play.google.com/store/apps/details?id=net.amaniart.peegin", "if you feel say you sabi pidgin, look wetin dey inside our website make your for add your own. Waka go peegin.com"]

    slangs = ["Wetin", "Oya", "Wahala", "commot", "Nawa", "abeg", "Yawa"]

    $client.search("#{slangs.sample}", result_type: "recent").take(3).each do |tweet|
      handle = tweet.user.screen_name
      handle_name = tweet.user.name.downcase


      if handle_name.include? "peegin"

      elsif handle_name.include? "pidgin"

      else
        $client.update("@#{handle} #{replies.sample}", in_reply_to_status_id: tweet.id)
        sleep(0.5)
      end
    end
  end


end
