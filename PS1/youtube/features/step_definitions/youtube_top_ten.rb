Given(/^Tammy visits the home page$/) do
  visit '/'
end

Then(/^Tammy should see the title of the list$/) do
  expect(page).to have_content('Top Ten Trending Videos On YouTube')
end

Then(/^Tammy should see all (\d+) titles of the videos$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
