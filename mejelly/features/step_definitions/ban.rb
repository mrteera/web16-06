Given(/^There is an inappropriate user$/) do
  @teera = FactoryGirl.create :inappropriate_member
end

Then(/^I search for Teera by email$/) do
  fill_in 'query', with: @teera.email
  click_button 'Refresh'
end

Then(/^I should see Teera's detail in the result$/) do
  expect(page).to have_content(@teera.email)
end

Then(/^I click on the edit button$/) do
  find('.edit_member_link a').click
end

Then(/^I select the is_banned flag$/) do
  find_by_id('user_is_banned').click
end

Then(/^I click save$/) do
  click_button 'Save'
end

Given(/^He is banned by admin$/) do
  @teera = FactoryGirl.create :banned_member
end

When(/^He tries to sign in$/) do
  visit 'users/sign_in'
  fill_in 'Email', with: @teera.email
  fill_in 'Password', with: @teera.password
  click_button 'Log in'
end

Then(/^He is denied access$/) do
  expect(page).to have_content('Your account is not activated yet.')
end
