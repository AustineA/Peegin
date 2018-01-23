task :clean => :environment do

  # dirts = ["sex", "fuck", "vagina", "dick", "preek", "toto", "pussy"]
  peegins = Peegin.all

  peegins.each do |peegin|
    lowcase_peegin = peegin.meaning.downcase

    if lowcase_peegin.include? "sex"
      peegin.update_attributes(clean: false)
    elsif lowcase_peegin.include? "fuck"
      peegin.update_attributes(clean: false)

    elsif lowcase_peegin.include? "vagina"
      peegin.update_attributes(clean: false)

    elsif lowcase_peegin.include? "dick"
      peegin.update_attributes(clean: false)

    elsif lowcase_peegin.include? "preek"
      peegin.update_attributes(clean: false)


    elsif lowcase_peegin.include? "toto"
      peegin.update_attributes(clean: false)


    elsif lowcase_peegin.include? "pussy"
      peegin.update_attributes(clean: false)

    elsif lowcase_peegin.include? "penis"
      peegin.update_attributes(clean: false)

    elsif lowcase_peegin.include? "testis"
      peegin.update_attributes(clean: false)

    else

    end





    # lowcase_peegin = peegin.meaning.downcase
    #
    # if dirts.each {|dirt| lowcase_peegin.include? dirt}
    #   peegin.update_attributes(clean: true)
    # end
  end

end
