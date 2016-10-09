Feature: Ban an inappropriate user

  Scenario: Reshma can ban Teera
    Given I am an admin
    And I am signed in
    And There is an inappropriate user
    When I visit the admin dashboard
    And I navigate to the Users menu
    Then I search for Teera by email
    And I should see Teera's detail in the result
    Then I click on the edit button
    And I select the is_banned flag
    And I click save