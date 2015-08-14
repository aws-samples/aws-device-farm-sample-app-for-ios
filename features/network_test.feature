Feature: Checking if a device has a internet connection
  As an Device Farm developer
  I want to verify that a device has internet
  So that users will be able to have connected test devices

Scenario: Ping Google
  Given I am on the ADF Welcome Screen
  Then I touch "HTTP"
  Then I fill in "navigation bar" with "http://www.google.com"
  Then I touch the "Go" button
  Then I wait for the webview to load
  Then the webview should be loaded
  And take picture


