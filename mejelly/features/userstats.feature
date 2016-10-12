Feature: Only admin access to User Stats page

  Scenario: A non-admin member attempts to access User Stats page
    Given I am a member
    And I am logged in
    When I visit the User Stats page
    And I get redirected to home page
    Then I should see the Access Denied message

  Scenario: An admin user attempts to access User Stats page
    Given I am an admin
    And I am signed in
    When I visit the User Stats page
    Then I should see the statistics