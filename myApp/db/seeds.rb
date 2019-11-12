# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [
    {:email => 'nandan@tamu.edu', :permissionLevel => 'officer', :linkedInUrl => ''},
    {:email => 'lienshao@tamu.edu', :permissionLevel => 'officer', :linkedInUrl => ''},
    {:email => 'danwgun@gmail.com', :permissionLevel => 'officer', :linkedInUrl => ''}
]
users.each do |user|
    User.create!(user)
end

events = [
    {:eventID => 1, :eventName => "Dell Workshop", :eventDescription => "A workshop with Dell.", :eventImage => "", :eventUsers => 'nandan@tamu.edu'},
    {:eventID => 2, :eventName => "Industrial Night", :eventDescription => "Come meet with ppl.", :eventImage => "", :eventUsers => 'admin1@tamu.edu'},
    {:eventID => 3, :eventName => "Movie Night", :eventDescription => "Watch a movie", :eventImage => "", :eventUsers => 'nmember1@tamu.edu'}
]
events.each do |e|
    Event.create!(e)
end

