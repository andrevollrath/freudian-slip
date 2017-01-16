class FreudianSlip::Counselor

	attr_accessor	:name, :title, :phone, :url, :source, :cost, :insurance,
                :specialties, :bio, :cure_rate

  @@all = []
  
  def self.all
    @@all
  end  
  
  def save
    @@all << self
  end

  def contact_counselor
    system("xdg-open", "https://therapists.psychologytoday.com/#{self.url}")
  end

  def get_details
    self.source.call(self)    
  end

end