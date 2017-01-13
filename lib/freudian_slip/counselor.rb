class FreudianSlip::Counselor

	attr_accessor	 :name, :certifications, :zip, :phone, :sex, 
					       :url, :source, :cost, :insurance, :specialties,
					       :focus, :treatment, :bio

  @@all = []
  
  def self.all
    @@all
  end  
  
  def save
    self.all << self
  end

  #Opens URL in favorite terminal
  def contact_counselor
    system("open '#{self.url}'")
  end

  #Passes self to scraper method wrapped in :source
  #Scraper then scrapes additional details and adds
  #to self
  def get_details
    self.source.call(self)    
  end

  def self.print_basic
  end

  def self.print_all
  end

end