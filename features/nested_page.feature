Feature: Nested
  As a Device Farm user
  I would like to be able to see examples of testing nested views
  So I can apply it to my future tests.

  Background: Navigate to Nested View
    Given that I navigate to the "More" menu category
    And I select the "Nested" option
    And I am on the Nested View Page
    Then I should see text containing "This is the first view"
  
  @Navigate
  Scenario: Next Navigation
    When I press the "Next" button
    Then I should see text containing "This is the second view"
    When I press the "Next" button
    Then I should see text containing "This is the third view"
    When I press the "Next" button
    Then I should see text containing "This is the fourth view"
    And I take a screenshot

  @Back
  Scenario: Back Navigation
    When I press the "Next" button
    Then I should see label containing "This is the second view"
    When I press the "Next" button
    Then I should see label containing "This is the third view"
    When I press the "Next" button
    Then I should see label containing "This is the fourth view"
    When I select the "Back" label tile
    Then I should see label containing "This is the third view"
    When I select the "Back" label tile
    Then I should see label containing "This is the second view"
    When I select the "Back" label tile
    Then I should see label containing "This is the first view"
    And I take a screenshot
