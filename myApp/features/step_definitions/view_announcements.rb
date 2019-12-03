When(/^member goes to homepage$/) do
  visit "https://77a39c2dc126472cb779ce07ffa73eee.vfs.cloud9.us-west-2.amazonaws.com/"
end 
When(/^member clicks on recent announcements link$/) do
  page.has_content?('Recent Announcements')
end 
Then(/^member goes to announcements page for members$/) do
  visit "https://77a39c2dc126472cb779ce07ffa73eee.vfs.cloud9.us-west-2.amazonaws.com/officer/announcement"
end 
