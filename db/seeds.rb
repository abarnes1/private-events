# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hosting_user = User.create(email: 'host@host.com', password: 'host123')
birthday_party = hosting_user.created_events.create(name: 'birthday party', location: "tom's house", date: (Date.today + 7))
private_party = hosting_user.created_events.create(name: 'ice cream jamboree', location: 'the basement', date: (Date.today + 7), private: true)
wedding = hosting_user.created_events.create(name: 'wedding', location: 'big gazebo', date: (Date.today + 30))
old_party = hosting_user.created_events.create(name: "new year's eve", location: 'smith home', date: '2021/12/31')

invited_guest = User.create(email: 'guest@guest.com', password: 'guest123')
attending_guest = User.create(email: 'attending@attending.com', password: 'attending123')

birthday_party.event_attendance.build(user_id: invited_guest.id, attendance_status: 0).save

birthday_party.event_attendance.build(user_id: attending_guest.id, attendance_status: 1).save
wedding.event_attendance.build(user_id: attending_guest.id, attendance_status: 0).save
