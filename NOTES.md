# Freudian Slip

Components
CLI
Scraper
Counselor


CLI Patterns
Gets URL
Calls Scraper for Counselors
Lists Counselors
Shows Menu
INP> Select a Counselor for more information?
IF then 
INP> Would you like to contact NAME now?
Yes, open URL in browser
Else list again, new search or exit.


OO  Question should Counselors know about scraper?
    Should scrape know about Counselors,?

    What if I add a fonebook. Fonebook, holds all my counselors,
    Fonebook knows how to list counselors, provide more details,
    how to contact counselors. Scrape sends hash of counselors to
    phonebook who records and then operates on them. Counselors
    are counselors and know who themselves but that's about it.

    Scrape send counselors to phonebook? Ya no hash objects instead.


CLI

1. Asks for zip code
2. Returns a list of counselors
3. Prompt -> more info, more results, new or exit


Scraper
Scrapes for Counselors based on ZIP.
Provides top 15?

Also scraps and returns more details
based on request for more information


Counselor has
-Name
-Certifications
-ZIP Code
-Telephone number
-Sex
-Profile URL

Finances
-Cost
-Accepts Insurance?

Specialties
LIST 3

Client Focus
Age: ?

Treatment Approach
LIST 3

Description
Grabs first paragraph