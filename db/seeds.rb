# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hosting_user = User.create(email: 'host@host.com', password: 'host123')
birthday_party = hosting_user.events.create(name: 'birthday party', location: "tom's house", date: '2022/02/12')
wedding = hosting_user.events.create(name: 'wedding', location: 'big gazebo', date: '2022/02/14')

attending_user = User.create(email: 'guest@guest.com', password: 'guest123')
birthday_party.attendees << attending_user
