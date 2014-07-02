# Fair Pair

Fair Pair is a tool to help you solve your pairing issues.

Fair Pair helps with the following:
* If you feel that your pair is a computer hog.
* If you feel that your pair doesn't do enough driving.
* If you feel that your pair doesn't take enough breaks.
* If you feel that your pair takes too many breaks.
* If you feel that there is something you need to tell your pair.
* Keeping track of who authors the commits pushed to GitHub when using Git-Duet.

Fair Pair does not help with:
* Your pair's bad breath
* Your pair's running mouth
* Your pair's annoying habits
* Your pair's lack of knowledge
* Your pair's rude attitude 

## Important Links
* Running Site [http://fair-pair.herokuapp.com/](http://fair-pair.herokuapp.com/)
* [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1114100)

## Setup

Please follow the steps below to get this site set up for local development.

1. Fork & clone the repo
1. `bundle` to install gems
1. `rake db:create db:migrate db:seed` to set up your local database
1. `RAILS_ENV=test rake db:migrate` to set up your test database
1. `rspec` to run specs
1. `rails s` to run your localserver:3000
