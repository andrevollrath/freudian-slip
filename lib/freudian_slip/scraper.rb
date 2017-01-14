class FreudianSlip::Scraper

  def self.scrape_counselors(zip = 10004)
    #url = "https://therapists.psychologytoday.com/rms/prof_results.php?search=#{zip}"
    url = "./fixtures/test.html"
    doc = Nokogiri::HTML(open(url))
    doc = doc.css("div[itemtype='http://schema.org/Person']")[0]

    counselor = FreudianSlip::Counselor.new
    counselor.name = doc.attr('data-prof-name')
    counselor.phone = doc.attr('data-phone')
    counselor.url = doc.attr('data-profile-url')
    counselor.title = doc.css('div .result-suffix span').collect {|x| x.text}.join(" ")
    counselor.save
    counselor
    # :name
    # :title
    # :phone
    # :url
    # :source
    # doc.search("div[itemtype='http://schema.org/Person']")[0]
    # doc.attr('data-prof-name')
    # doc.attr('data-phone')
    # doc.attr('data-profile-url')
    #
    # doc.search('div .result-suffix span')
    # ele.collect {|x| x.text}.join(" ")
  end

  def self.scrape_counselor(freud)

  end


end

