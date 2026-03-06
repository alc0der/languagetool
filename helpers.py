def assert_matches_is_list(response):
    """Verify the response has a valid matches list."""
    body = response.json()
    assert "matches" in body, "Response missing 'matches' key"
    assert isinstance(body["matches"], list), "Expected 'matches' to be a list"


def assert_matches_non_empty(response):
    """Verify that the LanguageTool response contains at least one match."""
    body = response.json()
    assert "matches" in body, "Response missing 'matches' key"
    assert len(body["matches"]) > 0, "Expected at least one match but got none — ngrams may not be loaded"
