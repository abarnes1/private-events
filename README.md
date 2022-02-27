
# Private Events

## Installation
### Prerequisites
* Ruby 2.7.2
* Rails 6.14
* PostgreSQL 9.2 or later (required for pg gem)
### Setup
* Clone this repository
* Navigate to this project's folder
* Run the following commands in order:
    - `bundle install`
    - `rails db:migrate`
    - `rails webpacker:install`
* Start the server `rails server`
* Open your browser to <http://localhost:3000/>

## Project
### Overview
This is the Private Events project created as part of The Odin Project's Ruby on Rails curriculum.  The main project goals were to implement a many to many Active Record association and practice using Active Record queries along with basic use of scopes.

### Desired Functionality

* Users can create events scheduled for future dates only.
* Events can be public or private (invitation only).
* Event creators can delete their events at any time.
* Event creators can edit event details and event attendance for future events.  Past events cannot be modified - only deleted.
* Event creators can invite users by email address.
* Users can remove themselves from events they are currently attending.

### Potential Improvements

* Add styling.  This is currently a functionality only project.
* Add additional user properties like first name, last name, and username.
* Allow users to edit their profiles and change passwords.
* Add model and integration tests.