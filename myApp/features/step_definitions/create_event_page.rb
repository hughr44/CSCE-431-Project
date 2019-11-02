When(/^member goes to event page$/) do
  visit "https://77a39c2dc126472cb779ce07ffa73eee.vfs.cloud9.us-west-2.amazonaws.com/event"
end 
Then(/^member can see events$/) do
  page.find("Avengers")
end 