Then(/^Tammy clicks About to divide by zero link$/) do
  click_link 'About to divide by zero'
end
#
# Then(/^Tammy should see divide by zero solution$/) do
#   expect(page).to have_content('Hello')
# end

Then(/^Tammy clicks Divide by zero link$/) do
  click_link 'Divide by zero'
end

Then(/^Tammy should see message About to divide by 0/) do
  expect(page).to have_content('About to divide by zero')
end
