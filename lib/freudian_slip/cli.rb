class FreudianSlip::CLI

  def call
    splash
    FreudianSlip::Scraper.scrape_counselors(gets.strip)
    program_loop
  end

  def program_loop
    exit = false
    
    until exit
      puts "\n" + "~" * 60
      puts "These are the counselors in your area:\n\n"
      list_counselors

      print "\nEnter a number for more information >> "
      input = gets.strip

      if input.to_i-1 <= FreudianSlip::Counselor.all.size
        freud = FreudianSlip::Counselor.all[input.to_i-1]

        list_more_details(freud)
        print "Would you like to contact this counselor? "
        input = gets.strip
        freud.contact_counselor if ["y","yes"].include?(input.downcase) 
        
        puts "\n" + "~" * 60
        print "Would you like to exit or list again? "
        input = gets.strip        
      end
      exit = true if input == "exit"
    end
    puts "Thanks for using Freudian Slip!\n\n"
  end

  def list_counselors
    FreudianSlip::Counselor.all.each_with_index do |counselor, i|
      puts "#{i+1}. #{counselor.name}:  #{counselor.title}"
    end
  end

  def list_more_details(freud)
    FreudianSlip::Scraper.scrape_counselor(freud)
    puts "\n" + "~" * 60
    puts "#{freud.name}:  #{freud.title}"
    puts "#{freud.phone}\n\n" 

    puts "#{freud.cost}" if !freud.cost.empty?
    puts "#{freud.insurance}" if !freud.insurance.empty?
    puts "#{freud.cure_rate}"
    puts "Specialties: #{freud.specialties}" if !freud.specialties.empty?
    
    puts "\n#{freud.bio}\n\n"
  end

  def splash
    puts  "\n~~~~~~~~~~~~~~~~~ Welcome to Freudian Slip ~~~~~~~~~~~~~~~~~"
    print "Please enter your ZIP code to get started >> "
  end

end