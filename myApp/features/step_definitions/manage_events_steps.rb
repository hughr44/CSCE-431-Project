When(/^officer goes to event page where admins can manage events$/) do
  visit "https://tranquil-atoll-38693.herokuapp.com/event"
end 
When(/^officer inputs event name and description$/) do
  visit "https://tranquil-atoll-38693.herokuapp.com/event"
end
And (/^officer presses the create button$/) do
    find('[name=commit]').click
end
Then(/^event is added to event page$/) do
    expect(page).to have_content("Avengers")
end