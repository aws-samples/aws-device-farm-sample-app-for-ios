Feature: Alert Page
  As a Device Farm user
  I would like to be able to see examples of testing alerts
  So I can apply it to my future tests.

  Background: Navigate to Alert Page
    Given that I navigate to the "More" menu category
    And I select the "Alerts" option
    And I am on the Alerts Page

  @Modal
  Scenario: Modal Alert
    When I select the "Modal" label tile
    Then I should see the Modal Alert Page with text "This is a modal view" and button labelled "OK"
    And I take a screenshot
    When I press the "OK" button
    Then I should not see the Modal Alert Page with text "This is a modal view"

  @Alert
  Scenario: Alert
    When I select the "Alert" label tile
    Then I should see the Alert Message with text "This is an alert" and button labelled "OK"
    And I take a screenshot
    When I select the "OK" label tile
    Then I should not see the Alert Message with text "This is an alert"
    