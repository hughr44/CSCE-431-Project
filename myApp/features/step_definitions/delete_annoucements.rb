When(/^officer goes to announcements page$/) do
  visit "https://tranquil-atoll-38693.herokuapp.com/officer/announcement"
end 
Then(/^officer clicks delete$/) do
  find_button('delete').click
end 
Then(/^announcement is deleted$/) do
    expect(page).not_to have_content("Dell")
end