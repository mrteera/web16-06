Given(/^I am a member$/) do
  @member = FactoryGirl.create :member
end

Given(/^I am logged in$/) do
  visit 'users/sign_in'
  fill_in 'Email', with: @member.email
  fill_in 'Password', with: @member.password
  click_button 'Log in'
end

When(/^I visit the User Stats page$/) do
  visit '/userstats'
end

When(/^I get redirected to home page$/) do
  expect(page).to have_current_path(root_path, only_path: true)
end

Then(/^I should see the Access Denied message$/) do
  expect(page).to have_content('Access denied.')
end

Then(/^I should see the statistics$/) do
  expect(page).to have_content('User Statistics')
 # save_and_open_page
end
