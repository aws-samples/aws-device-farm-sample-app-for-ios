Feature: Native Components
  As a Device Farm user
  I would like to be able to see examples of testing native components
  So I can apply it to my future tests.

  Background: Navigate to the Native Component Category
    Given that I navigate to the "Native" menu category
    And I am on the Native Component Page

  Scenario: Image Gallery
    When I select the "Image Gallery" label tile
    Then I should see the image gallery grid
    And I take a screenshot

  Scenario: Scroll View
    When I select the "Scrolling View" label tile
    Then I should see a scrollview
    And I scroll down
    And I take a screenshot
  
  @MediaPlayer
  Scenario: Media Player
    When I select the "Video Player" label tile
    Then I should see a movie playing
    And I take a screenshot

  Scenario: Camera
    When I select the "Camera" label tile
    Then I should see a camera preview
    And I take a screenshot
  
  @OutOfView
  Scenario: Out of View Content
    When I select the "Out of View Component" label tile
    Then I should scroll to see "This is hidden text"
    And I take a screenshot
