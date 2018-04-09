# ken mcfadden 
 [kenmcfadden.com](http://kenmcfadden.com)

This is a web based time tracking application.  It allows authenticated users to enter
time-sheet entries.
Overtime hours can also be entered and approved by an Admin role.

Some technical details and features:
##   Implementation of functionality: 
* POST model for capturing data.
* DEVISE based authentication
* register function removed..will use Administrate gem.
* ADMIN user feature (administrate gem).
* Approval workflow.
* SMS messages(Twilio) with links.
* Reporting(email) summaries to admins/managers.
* Overtime yes/no tracking.
* DOTENV to protect credentials.
* RSPEC and capybara for testing.
* Bootstrap
