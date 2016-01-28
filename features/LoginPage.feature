Feature: Login Page
  As a Device Farm user
  I would like to be able to see examples of testing a login page
  So I can apply it to my future tests.

  Background: Navigate to Login Page
    Given that I navigate to the "More" menu category
    And I select the "Login" option
    And I am on the Login Page
    Then I should see the login fields
    And I should see the login button

  @Login
  Scenario: Login Successfully
    When I type valid login credentials
    Then I should see the login message "Logged in as admin"
    And I should see the logout button with text "log out"
    And I take a screenshot
    When I press the "log out" button
    Then I should see the login fields
    And I should see the login button
    
  @InvalidLogin
  Scenario: Login Fail
    When I type invalid login credentials
    Then I should see the error message "PERMISSION DENIED"
    And I should see the try again button with text "try again"
    And I take a screenshot
    When I press the "try again" button
    Then I should see the login fields
    And I should see the login button
