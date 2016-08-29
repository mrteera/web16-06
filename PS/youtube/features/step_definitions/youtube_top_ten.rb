Given(/^Tammy visits home page$/) do
  visit '/'
end

Then(/^Tammy clicks PS1 link$/) do
  click_link 'Problem Set 1'
end

Then(/^Tammy should see the title of the list$/) do
  expect(page).to have_content('Top Ten Trending Videos On YouTube')
end

Then(/^Tammy should see all (\d+) titles of the videos$/) do |number_of_videos|
  expect(page).to have_css('ol li', count: number_of_videos.to_i)
end

Then(/^Tammy clicks Youtube Top Trends link$/) do
  click_link 'Youtube Top Trends'
end
