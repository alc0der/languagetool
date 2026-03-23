Feature: Custom dictionary
  Words added to en_spelling_additions.txt should be accepted by the spell checker after a container rebuild.

  Scenario: Custom word is not flagged as a spelling error
    Given the service is running on localhost
    When I send a check request with text "PostHog is a product analytics tool."
    Then the response has no matches

  Scenario: Custom word with original casing is accepted
    Given the service is running on localhost
    When I send a check request with text "Opsgenie handles incident management."
    Then the response has no matches
