# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [{:email => 'nandan@tamu.edu', :permissionLevel => 'admin', :linkedInUrl => ''},
        {:email => 'admin1@tamu.edu', :permissionLevel => 'admin', :linkedInUrl => ''},
        {:email => 'admin2@tamu.edu', :permissionLevel => 'admin', :linkedInUrl => ''},
        {:email => 'member1@tamu.edu', :permissionLevel => 'member', :linkedInUrl => ''},
        {:email => 'member2@tamu.edu', :permissionLevel => 'member', :linkedInUrl => ''},
    ]
users.each do |user|
    User.create!(user)
end
