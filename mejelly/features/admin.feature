Feature: View the recently registered users

  Scenario: Reshma can see the list of newly registered users
    Given I am an admin
    And I am signed in
    And There is a new memember
    When I visit the admin dashboard
    And I navigate to the Users menu
    Then I should see the list of newly registered users