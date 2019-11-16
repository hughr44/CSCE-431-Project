When(/^member goes to announcements page$/) do
  visit "https://tranquil-atoll-38693.herokuapp.com/announcement"
end 
Then(/^member can see announcements$/) do
  expect(page).to have_content("Annoucements")
end 