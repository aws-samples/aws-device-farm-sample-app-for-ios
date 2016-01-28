Feature: Home Page
  As a Device Farm user
  I would like to be able to see examples of testing a static homepage
  So I can apply it to my future tests.

  @Homepage
  Scenario: A Valid Homepage
    Given that I navigate to the "Home" menu category
    And I am on the Homepage
    Then I should see all the information
    And I take a screenshot
