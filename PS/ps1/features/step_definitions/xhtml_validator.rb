Then(/^Tammy should see XHTML validator$/) do
  url = 'https://validator.w3.org/check?uri=referer'
  expect(page).to have_link('', href: url)
end
