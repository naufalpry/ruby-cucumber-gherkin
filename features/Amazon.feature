@Amazon
Feature: Amazon

  @MainMenu
  Scenario: Sign In amazon
    Given open amazon
    Then signIn amazon
    Then validate sign in
  Scenario: Sign up amazon
    Given open amazon sign up
    Then sign up
    Then validate sign up
  