Then(/^Tammy clicks About to divided by zero link$/) do
  click_link 'About to divided by zero'
end

Then(/^Tammy should see div by zero solution$/) do
  expect(page).to have_content('Hello')
end

Then(/^Tammy clicks Divided by zero link$/) do
  click_link 'Divided by zero'
end

Then(/^Tammy should see messaage About to divide by 0/) do
  expect(page).to have_content('About to divide by zero')
end
