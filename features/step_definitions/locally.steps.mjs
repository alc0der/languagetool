import { Given, When, Then, setDefaultTimeout } from "@cucumber/cucumber";
import assert from "node:assert/strict";
import { execFile } from "node:child_process";
import { promisify } from "node:util";

setDefaultTimeout(30_000);

const BASE_URL = "http://localhost:8010";
const execFileAsync = promisify(execFile);

Given("the service is running on localhost", async function () {
  const res = await fetch(`${BASE_URL}/v2/languages`);
  assert.equal(res.status, 200, "LanguageTool service is not reachable");
});

When("I send a check request with text {string}", async function (text) {
  const res = await fetch(`${BASE_URL}/v2/check`, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({ language: "en-US", text }),
  });
  assert.equal(res.status, 200);
  this.checkBody = await res.json();
});

Then("I get a valid spellcheck response", function () {
  assert.ok(
    Array.isArray(this.checkBody.matches),
    "Response missing matches array",
  );
});

When("the container tries to reach an external host", async function () {
  try {
    await execFileAsync("container", [
      "exec",
      "languagetool",
      "wget",
      "-q",
      "--spider",
      "--timeout=5",
      "http://example.com",
    ]);
    this.containerExecExitCode = 0;
  } catch (err) {
    this.containerExecExitCode = err.code ?? 1;
  }
});

Then("the connection fails", function () {
  assert.notEqual(
    this.containerExecExitCode,
    0,
    "Container was able to reach the internet — network isolation is broken",
  );
});
