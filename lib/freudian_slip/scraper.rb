class FreudianSlip::Scraper

  def self.scrape_counselors(zip = 10004)
    #url = "https://therapists.psychologytoday.com/rms/prof_results.php?search=#{zip}"
    url = "./fixtures/test.html"
    doc = Nokogiri::HTML(open(url))
    doc = doc.css("div[itemtype='http://schema.org/Person']")

    doc.each do |person|
      counselor = FreudianSlip::Counselor.new
      counselor.name = person.attr('data-prof-name')
      counselor.title = person.css('div .result-suffix span').collect {|x| x.text}.join(" ")
      counselor.phone = person.attr('data-phone')
      counselor.url = person.attr('data-profile-url')
      counselor.source = FreudianSlip::Scraper.method(:scrape_counselor)
      counselor.save
    end
    FreudianSlip::Counselor.all
  end

  def self.scrape_counselor(freud = nil)
    
    url = "./fixtures/meredith.html"
    doc = Nokogiri::HTML(open(url))
    doc = doc.css("div #profile-content")

    temp = []
    temp << doc.css("div .statementPara")[0].text.strip #Bio
    temp << doc.css("div ul.specialties-list li").collect {|x| x.text}.join(", ") #Specialties

    doc = doc.css("div .profile-finances ul li").collect {|x| x.text.strip}
    temp << doc.detect {|x| /Avg Cost|Accepts/ === x} #Cost
    temp << doc.detect {|x| /Accepts/ === x}  #Insurance
    temp << "#{rand(10..100)}%" #Cure rate
    temp

      #blk = ele.css("div .profile-finances ul li").collect {|x| x.text.strip}
      #blk.select {|x| /Avg Cost|Accepts/ === x}
      #:cost
      #blk.detect {|x| /Avg Cost/ === x}
      #
      #:insurance
      #blk.detect {|x| /Accepts/ === x}
      #
      #:specialties
      #ele.css("div ul.specialties-list li").collect {|x| x.text}.join(", ")
      #
      #
      #:bio -- Needed to set to a max # characters append ...
      #ele.css("div .statementPara")[0].text.strip
      #
      #cure_rate = "#{rand(10..100)}%"
      
  end

end

