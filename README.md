# Volunteer Tracker

#### Program that lets a user track projects and volunteers 02/23/2018

#### By **Anna Marie Cooper**

## Description

Application that allows users to save projects to a database, edit and delete them, and add associated volunteers.

#### Behavior
1. Asks user for two words or phrases, informs user if they are anagrams regardless of capitilization or spacing.
  * example input: "A Bar Potty" "partyboat"
  * example output: "Yes, 'A Bar Potty' is an anagram of 'partyboat'!"
2. Asks user for two words or phrases, informs user if they are antigrams regardless of capitilization or spacing.
  * example input: "pry" "ask"
  * example output: "That's no anagram, but 'ask' is an antigram of 'pry'!"
3. Asks user for two words or phrases, informs user if they aren't words. Only checks to make sure there are vowels.
  * example input: "prp" "ask"
  * example output: "Um, 'prp' isn't a word, dummy."


## Setup/Installation Requirements

* Open terminal
* Move to desired folder
* Type "git clone https://github.com/rogueminx/volunteer_tracker.git"
* Make sure Sinatra is installed.
* Copy database by typing into terminal: "createdb volunteer_tracker", "psql volunteer_tracker < database_backup.sql" "createdb -T volunteer_tracker volunteer_tracker_test"
* Type ruby app.rb to start Sinatra.
* Navigate to http://localhost:4567/ in your browser to interact. 


## Known Bugs

None

## Support and contact details

Please contact me through github with questions.

## Technologies Used

* Ruby
* Sinatra
* Postgres

### License

Copyright (c) 2018  **Anna Marie Cooper**
