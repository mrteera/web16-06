Feature: Divided by Zero

  Scenario: Tammy would like to see error page on production mode
    Given Tammy visits home page
    Then Tammy clicks About to divide by zero link
    Then Tammy should see divide by zero solution
    Then Tammy clicks Divide by zero link
    And Tammy should see message About to divide by 0
