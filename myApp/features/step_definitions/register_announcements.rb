When(/^officer goes to announcements page$/) do
  visit "https://tranquil-atoll-38693.herokuapp.com/officer/announcement"
end 
Then(/^officer enters in input$/) do
  fill_in('announcementTitle', with: 'Dell')
end 
Then(/^officer clicks create$/) do
  find_button('commit').click
end 