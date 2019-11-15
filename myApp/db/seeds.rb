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

events = [{:eventName => "Dell Workshop", :eventDescription => "A workshop with Dell.", :eventImage => "dell.jpg"},
        {:eventName => "Industrial Night", :eventDescription => "Come meet with ppl.", :eventImage => "https://hispanicstudies.tamu.edu/wp-content/uploads/sites/6/2015/03/academic-1.jpg"},
        {:eventName => "Movie Night", :eventDescription => "Watch a movie", :eventImage => "movie.jpg"}
    ]
events.each do |e|
    Event.create!(e)
end

usersEvents = [ {:userEmail => "lienshao@tamu.edu", :eventName => "Dell Workshop"},
            {:userEmail => "nandan@tamu.edu", :eventName => "Dell Workshop"},
            {:userEmail => "danwgun@tamu.edu", :eventName => "Dell Workshop"},
            {:userEmail => "lienshao@tamu.edu", :eventName => "Industrial Night"},
            {:userEmail => "nandan@tamu.edu", :eventName => "Industrial Night"},
            {:userEmail => "danwgun@tamu.edu", :eventName => "Movie Night"}
            ]
usersEvents.each do |a|
    UsersEvent.create!(a)
end
    
announcements = [ {:announcementTitle => "Upcoming Workshop!", :announcementText => "We have an upcoming workshop with Dell on Monday! See you there!"},
                {:announcementTitle => "Congrats!", :announcementText => "Members of Data Analytics Club attanted TAMUHACK and got the 1st price!"}
    ]
announcements.each do |n|
    Announcement.create!(n)
end

