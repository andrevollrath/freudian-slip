class FreudianSlip::Counselor

	attr_accessor	 :name, :certifications, :zip, :phone, :sex, 
					       :url, :cost, :insurance, :specialties,
					       :focus, :treatment, :bio

  @@all = []

  def self.all
    @@all
  end  

  def save
    self.all << self
  end

  def contact_counselor
    system("open '#{self.url}'")
  end

  #Passes url and gets back hash that it uses to fill variables
  #Each counselor won't neccesarrily have all details
  def more_details
    detailed_hash = FreudianSlip::Scraper.new(self.url).scrape_counselor    
    detailed_hash.each {|k, v| self.send("#{k}=",v)}
  end

end