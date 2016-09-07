Then(/^Tammy clicks About to divide by zero link$/) do
  click_link 'About to divide by zero'
end

Then(/^Tammy should see divide by zero solution$/) do
  expect(page).to have_content(
    'The details about this task are available here.'
  )
  expect(page).to have_link('here', href: '/report/ps1_divide_by_zero.pdf')
end

Then(/^Tammy clicks Divide by zero link$/) do
  click_link 'Divide by zero'
end

Then(/^Tammy should see message About to divide by 0/) do
  expect(page).to have_content('About to divide by zero')
end
