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

events = [{:eventName => "Dell Workshop", :eventDescription => "A workshop with Dell.", :eventImage => "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Dell_logo_2016.svg/1200px-Dell_logo_2016.svg.png"},
        {:eventName => "Industrial Night", :eventDescription => "Come meet with ppl.", :eventImage => "https://hispanicstudies.tamu.edu/wp-content/uploads/sites/6/2015/03/academic-1.jpg"},
        {:eventName => "Movie Night", :eventDescription => "Watch a movie", :eventImage => "https://uvmbored.com/wp-content/uploads/2018/07/movienight.jpg"}
    ]
events.each do |e|
    Event.create!(e)
end

usersEvents = [ {:email => "lienshao@tamu.edu", :eventName => "Dell Workshop"},
            {:email => "nandan@tamu.edu", :eventName => "Dell Workshop"},
            {:email => "danwgun@tamu.edu", :eventName => "Dell Workshop"},
            {:email => "lienshao@tamu.edu", :eventName => "Industrial Night"},
            {:email => "nandan@tamu.edu", :eventName => "Industrial Night"},
            {:email => "danwgun@tamu.edu", :eventName => "Movie Night"}
            ]
usersEvents.each do |a|
    UsersEvent.create!(a)
end
    
announcements = [ {:announcementTitle => "Upcoming Workshop!", :announcementText => "We have an upcoming workshop with Dell on Monday! See you there!"},
                {:announcementTitle => "Congrats!", :announcementText => "Members of Data Analytics Club attanted TAMUHACK and got the 1st price!"},
                {:announcementTitle => "ann1", :announcementText => "text1"},
                {:announcementTitle => "ann2", :announcementText => "text2"},
                {:announcementTitle => "ann3", :announcementText => "text3"},
                {:announcementTitle => "ann4", :announcementText => "text4"}
    ]
announcements.each do |n|
    Announcement.create!(n)
end

