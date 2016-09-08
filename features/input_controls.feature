Feature: Input Controls
  As a Device Farm user
  I would like to be able to see examples of testing input controls
  So I can apply it to my future tests.

  Background: Navigate to Input Controls
    Given that I navigate to the "Inputs" menu category
    And I am on the Input Controls page

  @TextView
  Scenario: TextView
    Then I should see a text view
