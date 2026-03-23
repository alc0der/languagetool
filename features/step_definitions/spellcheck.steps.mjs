import { Then } from "@cucumber/cucumber";
import assert from "node:assert/strict";

Then("the response has no matches", function () {
  assert.ok(Array.isArray(this.checkBody.matches), "Response missing matches array");
  assert.equal(this.checkBody.matches.length, 0, "Expected no matches");
});

Then("the response has at least one match", function () {
  assert.ok(Array.isArray(this.checkBody.matches), "Response missing matches array");
  assert.ok(
    this.checkBody.matches.length > 0,
    "Expected at least one match but got none — ngrams may not be loaded",
  );
});
