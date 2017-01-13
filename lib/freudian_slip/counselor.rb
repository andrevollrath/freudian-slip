# Counselor has
#-Name
#-Certifications
#-ZIP Code
#-Telephone number
#-Sex
#-Profile URL

#Finances
#-Cost

#-Accepts Insurance?

#Specialties
#LIST 3

#Client Focus
#Age: ?
#Treatment Approach
#LIST 3
#Description
#Grabs first paragraph
#
# 
#Accessors
#
#
# 
#
#



class FreudianSlip::Counselor

  @@all = []

	attr_accessor 	:name, :certifications, :zip, :phone, :sex, 
					:url, :cost, :insurance, :specialties,
					:focus, :treatment, :description

  def self.all
    @@all
  end

  



end