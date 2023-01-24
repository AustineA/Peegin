task :clean => :environment do

  dirts = ["sex", "fuck", "vagina", "dick", "preek", "toto", "pussy", "penis", "testis", "vagina"]
  peegins = Peegin.all

  peegins.each do |peegin|
    lowcase_peegin = peegin.meaning.downcase

    dirts.each do |word|
      peegin.update(clean: false) if lowcase_peegin.include? word
    end
  end

end
