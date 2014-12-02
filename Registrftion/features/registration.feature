Feature: Registration
Background:
  Given I click on Register link
  Scenario: valid registration
    And I fill up text fields with Vasja6
    And I click on submit button
    Then Link is appeared