Feature: Divided by Zero

  Scenario: Tammy would like to see error page on production mode
    Given Tammy visits home page
    Then Tammy clicks About to divided by zero link
    Then Tammy should see div by zero solution
    Then Tammy clicks Divided by zero link
    And Tammy should see messaage About to divide by 0
