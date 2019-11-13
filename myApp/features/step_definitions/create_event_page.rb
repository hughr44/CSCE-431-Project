When(/^member goes to event page$/) do
  visit "https://tranquil-atoll-38693.herokuapp.com/event"
end 
Then(/^member can see events$/) do
  page.find("Avengers")
end 