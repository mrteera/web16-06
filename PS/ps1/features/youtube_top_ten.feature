Feature: Top Ten Trending Videos on YouTube

  Scenario: Tammy would like to see the list of 10 most popular videos on YouTube
    Given Tammy visits home page
    Then Tammy clicks Youtube Top Trends link
    Then Tammy should see the title of the list
    And Tammy should see all 10 titles of the videos
