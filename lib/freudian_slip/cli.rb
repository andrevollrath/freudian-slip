class FreudianSlip::CLI

#CLI Patterns
#::Gets ZIP 
#Calls Scraper for Counselors
#Lists Counselors
#Shows Menu
#::Select a Counselor for more information?
#If Yes then show more information 
#::Would you like to contact NAME now?
#Yes, open URL in browser
#Else list again, new search or exit.

  def call
    splash
    FreudianSlip::Scraper.scrape_counselors(gets.strip)
    list_counselors
    menu
  end

  def menu
    
  end

  def list_more_details
  
  end

  def list_counselors

  end

  def splash
    puts "Welcome to Freudian Slip"
    puts "Please enter your ZIP code to get started >>"
  end

end