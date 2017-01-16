class FreudianSlip::Counselor

	attr_accessor	:name, :title, :phone, :url, :source, :cost, :insurance,
                :specialties, :treatment, :bio, :cure_rate

  @@all = []
  
  def self.all
    @@all
  end  
  
  def save
    @@all << self
  end

  def contact_counselor
    system("open '#{self.url}'")
  end

  def get_details
    self.source.call(self)    
  end

end