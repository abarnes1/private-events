# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hosting_user = User.create!(email: 'host@host.com', password: 'host123')
other_hosting_user = User.create!(email: 'hoster@partytime.com', password: 'host123')
random_user_1 = User.create(email: 'jimmy_b@gmail.com', password: 'jimmy123')
random_user_2 = User.create(email: 'pickle_chugger@aol.com', password: 'pickle123')

birthday_party = hosting_user.created_events.create!(
  name: 'Surprise Birthday Party',
  location: "Tom's House",
  date: (Date.today + 60),
  description: <<~DESCRIPTION
    Tom is turning 30! Join us for the big birthday celebration!  We'll be breaking into Tom's house the
    night before to decorate and will jump out and scare him the next day when he returns home from a work trip.
    Surprise! Haha! BYOB.
  DESCRIPTION
)

ice_cream_jamboree = hosting_user.created_events.create(
  name: 'Ice Cream Jamboree',
  location: 'Ice cream parlor basement',
  date: (Date.today + 90),
  private: true,
  description: <<~DESCRIPTION
    Enjoy some ice cream the way it was intended: in the basement.  Area ice cream chefs have hand crafted 20
    artisinal flavor combinations to compete for the night's favorite flavor.  The winner goes home with the
    cell phones that (used to) belong to the other competitors.  Upgraaaaaaades!
  DESCRIPTION
)

nickel_event = hosting_user.created_events.create(
  name: 'Nickel Grabbing Contest',
  location: 'St. Louis Arch',
  date: (Date.today + 180),
  description: <<~DESCRIPTION
    Ten thousand nickels will be dropped from the top of the arch at noon.  If you can catch it, you can keep it.
    Participants must sign an insurance waiver prior to entering the event area.  Cargo shorts have been deemed
    an unfair advantage and will not be allowed in the event area.
  DESCRIPTION
)

wedding = hosting_user.created_events.build(
  name: "Bill and Jill's Wedding",
  location: 'Community Gazebo #5',
  date: (Date.today - 30),
  description: <<~DESCRIPTION
    Bill and Jill are finally tying the knot.  You know what they say... the fifth time's the charm.  A corndog
    buffet will be provided after the ceremony.
  DESCRIPTION
)
wedding.save(validate: false)

new_years_eve = hosting_user.created_events.build(
  name: '2019 Year End Bash',
  location: 'The Stadium',
  date: '2019-12-31',
  description: <<~DESCRIPTION
    Party like it's 2019 if you want.  Celebrate a different year - who cares! Have some fun! Shake
    that ominous feeling that the world is about to get real weird.
  DESCRIPTION
)

new_years_eve.save(validate: false)

other_new_years_eve = other_hosting_user.created_events.build(
  name: 'The Better 2019 Year End Bash',
  location: 'The Better Stadium',
  date: '2019-12-31',
  description: <<~DESCRIPTION
    Don't go anywhere else to party at the end of 2019.  This is the best party in town.
    WE HAVE A T-SHIRT CANNON.  Clean out your closet and we'll redistribute your unwanted clothing.
  DESCRIPTION
)
other_new_years_eve.save(validate: false)

birthday_party.event_attendance.build(user_id: random_user_1.id, attendance_status: :invited).save
birthday_party.event_attendance.build(user_id: random_user_2.id, attendance_status: :attending).save

other_new_years_eve.event_attendance.build(user_id: other_hosting_user.id, attendance_status: :invited).save

wedding.event_attendance.build(user_id: random_user_1.id, attendance_status: :invited).save
wedding.event_attendance.build(user_id: random_user_2.id, attendance_status: :invited).save
wedding.event_attendance.build(user_id: other_hosting_user.id, attendance_status: :invited).save
