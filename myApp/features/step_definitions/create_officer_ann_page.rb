When(/^officer goes to homepage$/) do
  visit "https://77a39c2dc126472cb779ce07ffa73eee.vfs.cloud9.us-west-2.amazonaws.com/"
end
When(/^officer clicks on Management Pages$/) do
  page.has_content?('Management Pages')
end 
When(/^officer clicks on Manage Managements$/) do
  page.has_content?('Manage Managements')
end 
Then(/^officer should arrive at officer management page$/) do
  visit "https://77a39c2dc126472cb779ce07ffa73eee.vfs.cloud9.us-west-2.amazonaws.com/officer/announcement"
end 
