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

  def self.scrape_counselor(freud)
    
    url = "./fixtures/meredith.html"
    doc = Nokogiri::HTML(open(url))
    doc = doc.css("div #profile-content")

    biopic = doc.css("div .statementPara")[0].text.strip #Bio
    freud.bio = biopic.split("").count > 299 ? biopic[0..299] + "..." : biopic +"..."
    freud.specialties = doc.css("div ul.specialties-list li").collect {|x| x.text}.join(", ") #Specialties

    doc = doc.css("div .profile-finances ul li").collect {|x| x.text.strip}
    freud.cost = doc.detect {|x| /Avg Cost/ === x} #Cost
    freud.insurance = doc.detect {|x| /Accepts/ === x}  #Insurance
    freud.cure_rate = "Cure rate: #{rand(10..100)}%" #Cure rate
  end

end

