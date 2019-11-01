When(/^officer goes to homepage where admins can manage events$/) do
  visit root_path
end 
When(/^officer inputs event name and description$/) do
  visit root_path
end
And (/^officer presses submit$/) do
    click_button 'Login'
end
Then(/^event is added to home page$/) do
    expect(page).to have_content("RoR Auth0 Sample")
end