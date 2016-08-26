Feature: XHTML Validator

  Scenario: Tammy would like to see XHTML validator on all pages
    Given Tammy visits home page
    Then Tammy should see XHTML validator
    Then Tammy clicks PS1 link
    Then Tammy should see XHTML validator
