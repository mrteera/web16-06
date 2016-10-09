Given(/^I am an admin$/) do
  @reshma = FactoryGirl.create :admin
end

Given(/^I am signed in$/) do
  visit 'users/sign_in'
  fill_in 'Email', with: @reshma.email
  fill_in 'Password', with: @reshma.password
  click_button 'Log in'
end

Given(/^There is a new memember$/) do
  @kan = FactoryGirl.create :member
end

When(/^I visit the admin dashboard$/) do
  visit '/admin'
end

When(/^I navigate to the Users menu$/) do
  #save_and_open_page
  first("a",text: 'Users').click
end

Then(/^I should see the list of newly registered users$/) do
  expect(page).to have_content(@kan.email)
end