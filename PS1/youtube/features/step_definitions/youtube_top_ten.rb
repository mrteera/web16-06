Given(/^Tammy visits the home page$/) do
  visit '/'
end

Then(/^Tammy should see the title of the list$/) do
  expect(page).to have_content('Top Ten Trending Videos On YouTube')
end
