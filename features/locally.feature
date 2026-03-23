Feature: Privacy
  Spellchecks are almost key-loggers. A spellchecker that runs locally and without internet may provide needed assurances.

  Scenario: Spellchecker is accessible locally
    Given the service is running on localhost
    When I send a check request with text "This is a tset"
    Then I get a valid spellcheck response

  Scenario: Container has no internet access
    Given the service is running on localhost
    When the container tries to reach an external host
    Then the connection fails
