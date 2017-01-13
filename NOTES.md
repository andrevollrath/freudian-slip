# Freudian Slip

Components
CLI
Scraper
Counselor

Relegated my OO thoughts going to use Avi's basic techcrunch pattern.

CLI Patterns
::Gets ZIP 
Calls Scraper for Counselors
Lists Counselors
Shows Menu
::Select a Counselor for more information?
If Yes then show more information 
::Would you like to contact NAME now?
Yes, open URL in browser
Else list again, new search or exit.

Scraper Pattern
Initialized with URL
scrape_counselors 
scrape_counselor

Counselor Pattern
Don't intiate, use @@all
Each scraped is saved to all
contact_counselor -- system("open '#{url}'")
uses scrape_counselor to fill in extra data.


Scraper
Scrapes for Counselors based on ZIP.
Provides top 15?

