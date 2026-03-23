Feature: Spellcheck
  LanguageTool provides grammar and spell checking via its HTTP API.

  Scenario: Simple text with no errors returns an empty matches list
    Given the service is running on localhost
    When I send a check request with text "A simple test."
    Then the response has no matches

  Scenario: Ngram confusion pair detection
    Given the service is running on localhost
    When I send a check request with text "Don't forget to put on the breaks."
    Then the response has at least one match
