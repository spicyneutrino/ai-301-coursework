# Unit 1 — Issue Selection

Path: `beat-1-sandbox/unit-1/selection.md`

Record of the issue carried into Unit 2, and of the evaluation runs that produced
`eval-run.txt`. This file is graded at the path above; a copy kept anywhere else in
the repository is not read.

Complete every labelled field below. Each is graded on its own; content placed under the
wrong label is not graded.

---

## Selected issue

**Issue link**

https://github.com/codepath/pathreview-ai301-fa26-s3/issues/73

**Verdict output**

**Note on this field:** the template below requires a recorded `accept`. My live run
recorded `reject` for this issue, and for the other two candidates I graded
(#71, #70), because the repo-level "Maintainer activity" required check fails for
every issue in this repository (zero pull requests have ever been merged in
`codepath/pathreview-ai301-fa26-s3`). I am submitting the actual output as-is rather
than revising the rubric or re-running to manufacture an `accept`, per my own
instruction not to change any verdict or perform additional eval runs. See
"Selection rationale" below for why #73 was still the strongest candidate among
the three on every issue-level check.

The verbatim live-mode output (all three candidates graded in one run; #73 is the
first object in the JSON array) is pasted below, ending with the fenced JSON verdict
block:

```
## Summary

Repo facts (apply to all three candidates): `codepath/pathreview-ai301-fa26-s3`, created 2026-09-10, not archived, last push 2026-09-16, no releases. Zero pull requests exist in this repo — none open, none merged, ever (`gh pr list --state all` → `[]`). All commits to `main` are direct pushes by one author (Andrew Burke), not merged PRs.

That's fatal under the rubric as written: Maintainer activity requires a PR merged within 30 days, and none have ever merged. Since this is a repo-level fact, it fails identically for every issue in this repo, independent of how good the issue itself is.

| Check | #73 | #71 | #70 |
|---|---|---|---|
| Maintainer activity (required) | fail — 0 merged PRs ever | fail | fail |
| Recent repository use (required) | pass — commit 2026-09-16, within 30d | pass | pass |
| Stale contribution backlog (preferred) | pass — 0 open PRs | pass | pass |
| Issue is unclaimed (required) | pass — no assignee/PR/comments | pass | pass |
| Contribution allowed by policy (required) | pass — docs/CONTRIBUTING.md has no AI ban | pass | pass |
| Issue scope is bounded (required) | pass — 2 files, 1-2h | pass — 2 files, 1-2h | pass — 3 files, 2-4h, still one bug |
| Expected outcome identifiable (required) | pass — make files agree on key name | pass — remove indent + xfail marker | pass — same pattern |
| Investigation path exists (required) | pass — files + variable names given | pass — file, test name, manifest id H-04 | pass — file, test name, manifest id H-03 |
| No unresolved external blocker (required) | pass | pass | pass |
| Recent maintainer response (preferred) | fail — no comments | fail | fail |
| Newcomer-sized change (required) | pass | pass | pass |

Verdict for all three: reject — one required check ("Maintainer activity") fails, and per the rubric's verdict rule that alone rejects an issue regardless of every other check passing.

Tension worth flagging: this is a freshly-created course section copy (2 weeks old) where PRs get merged after students solve issues — the check is measuring "has anyone finished a first issue here yet," not "is this project alive." That's a real signal for a brand-new classroom repo, but it means the rubric as written can't currently accept any issue from this repo until the first PR merges. If you want a verdict that isn't structurally reject-only, the fix is in rubric.md (e.g., waive/adjust "Maintainer activity" for repos under a certain age, or for a stated course-sandbox context), not in this run. If that check were waived, all three would pass every other required check, and by your fit profile (backend/API/debugging, small scope) I'd rank #73 first (smallest, pure config/doc fix), then #71, then #70 (slightly larger, touches the parser + fixtures + conftest).

[
  {
    "item": "https://github.com/codepath/pathreview-ai301-fa26-s3/issues/73",
    "checks": [
      {"name": "Maintainer activity", "grade": "fail", "evidence": "gh pr list --state all -R codepath/pathreview-ai301-fa26-s3 returns [] — zero PRs merged or opened in repo history"},
      {"name": "Recent repository use", "grade": "pass", "evidence": "commit 2f4e82f pushed to main 2026-09-16, within 30 days of 2026-09-23"},
      {"name": "Stale contribution backlog", "grade": "pass", "evidence": "0 open PRs in repo"},
      {"name": "Issue is unclaimed", "grade": "pass", "evidence": "assignees: [], no comments, no linked PR in issue timeline"},
      {"name": "Contribution is allowed by project policy", "grade": "pass", "evidence": "docs/CONTRIBUTING.md states workflow with no AI-use ban or restriction"},
      {"name": "Issue scope is bounded", "grade": "pass", "evidence": "body: 'Make the two files agree' between README.md and .env.example, estimated 1-2 hours"},
      {"name": "Expected outcome is identifiable", "grade": "pass", "evidence": "body specifies core/config.py defines both keys; files must be made consistent with it"},
      {"name": "Investigation path exists", "grade": "pass", "evidence": "body names README.md, .env.example, core/config.py as relevant files"},
      {"name": "No unresolved external blocker", "grade": "pass", "evidence": "no comment thread, no dependency mentioned"},
      {"name": "Recent maintainer response", "grade": "fail", "evidence": "comments: [] — no maintainer activity on thread"},
      {"name": "Newcomer-sized change", "grade": "pass", "evidence": "single doc/config alignment fix, 1-2 hour estimate"}
    ],
    "verdict": "reject"
  },
  {
    "item": "https://github.com/codepath/pathreview-ai301-fa26-s3/issues/71",
    "checks": [
      {"name": "Maintainer activity", "grade": "fail", "evidence": "gh pr list --state all -R codepath/pathreview-ai301-fa26-s3 returns [] — zero PRs merged or opened in repo history"},
      {"name": "Recent repository use", "grade": "pass", "evidence": "commit 2f4e82f pushed to main 2026-09-16, within 30 days of 2026-09-23"},
      {"name": "Stale contribution backlog", "grade": "pass", "evidence": "0 open PRs in repo"},
      {"name": "Issue is unclaimed", "grade": "pass", "evidence": "assignees: [], no comments, no linked PR in issue timeline"},
      {"name": "Contribution is allowed by project policy", "grade": "pass", "evidence": "docs/CONTRIBUTING.md states workflow with no AI-use ban or restriction"},
      {"name": "Issue scope is bounded", "grade": "pass", "evidence": "body: fix indentation in one test fixture and remove one xfail marker, estimated 1-2 hours"},
      {"name": "Expected outcome is identifiable", "grade": "pass", "evidence": "body: 'Remove the indentation... remove the marker as part of the fix'"},
      {"name": "Investigation path exists", "grade": "pass", "evidence": "body names tests/unit/test_readme_parser.py, ingestion/parsers/readme_parser.py, and xfail manifest id H-04"},
      {"name": "No unresolved external blocker", "grade": "pass", "evidence": "no comment thread, no dependency mentioned"},
      {"name": "Recent maintainer response", "grade": "fail", "evidence": "comments: [] — no maintainer activity on thread"},
      {"name": "Newcomer-sized change", "grade": "pass", "evidence": "single test-fixture fix plus marker removal, 1-2 hour estimate"}
    ],
    "verdict": "reject"
  },
  {
    "item": "https://github.com/codepath/pathreview-ai301-fa26-s3/issues/70",
    "checks": [
      {"name": "Maintainer activity", "grade": "fail", "evidence": "gh pr list --state all -R codepath/pathreview-ai301-fa26-s3 returns [] — zero PRs merged or opened in repo history"},
      {"name": "Recent repository use", "grade": "pass", "evidence": "commit 2f4e82f pushed to main 2026-09-16, within 30 days of 2026-09-23"},
      {"name": "Stale contribution backlog", "grade": "pass", "evidence": "0 open PRs in repo"},
      {"name": "Issue is unclaimed", "grade": "pass", "evidence": "assignees: [], no comments, no linked PR in issue timeline"},
      {"name": "Contribution is allowed by project policy", "grade": "pass", "evidence": "docs/CONTRIBUTING.md states workflow with no AI-use ban or restriction"},
      {"name": "Issue scope is bounded", "grade": "pass", "evidence": "body: fix indented fixture in tests/conftest.py causing parser to find no headings; one bug, estimated 2-4 hours"},
      {"name": "Expected outcome is identifiable", "grade": "pass", "evidence": "body: 'The parser isn't wrong; the fixture shouldn't be indented' + remove xfail marker H-03"},
      {"name": "Investigation path exists", "grade": "pass", "evidence": "body names tests/conftest.py, tests/unit/test_readme_parser.py, ingestion/parsers/readme_parser.py, and manifest id H-03"},
      {"name": "No unresolved external blocker", "grade": "pass", "evidence": "no comment thread, no dependency mentioned"},
      {"name": "Recent maintainer response", "grade": "fail", "evidence": "comments: [] — no maintainer activity on thread"},
      {"name": "Newcomer-sized change", "grade": "pass", "evidence": "single fixture-indentation bug spanning 3 files, still one coherent fix"}
    ],
    "verdict": "reject"
  }
]
```

---

## Eval iterations

Quote source text directly in each field below. Paraphrase does not satisfy them.

**Run history**

In order:

1. Initial full eval: 15/20.
2. Revised the scope, expected-outcome, investigation-path, newcomer-size, and
   contribution-policy checks because several clear accepts were being rejected —
   the scope/newcomer/investigation checks were too strict, and the policy category
   was missed entirely by the original rubric.
3. Targeted rerun on the affected items (issue-01, issue-04, issue-12, issue-15,
   issue-19): 4/5 matched gold.
4. Final complete saved run: 18/20, with categories `claimed 4/4  clear-accept 8/8
   dead-repo 3/3  policy 0/1  scope 3/4`.

The committed `eval-run.txt` records this final run's exact line, quoted directly:

> `agreement: 18/20 scored items  (bar: 18/20: below the bar; category floor unmet: no match in policy)`

That line is the source of truth for the final score; the intermediate 15/20 and
4/5 figures above are as I tracked them during iteration and are not independently
re-quotable from a saved log, since only the final run's output was written to
`eval-run.txt` (no rerun was performed to regenerate the earlier logs, per
instruction).

**Issue analysis**

`issue-12` — gold verdict `reject`, final rubric verdict `accept` (mismatch, logged
in `eval-run.txt` as `issue-12  reject  accept   NO     graded accept`).

The rubric does have a contribution-policy check ("Contribution is allowed by
project policy"), but it still did not consistently treat policy evidence as a
blocking condition when the issue otherwise appeared technically feasible. On
issue-12 the technical checks (scope, expected outcome, investigation path,
newcomer-sizing) all read as satisfied, and that technical feasibility seems to
have outweighed the policy-blocking evidence when grading the check, producing
`accept` where gold says `reject`. This shows that technical feasibility and
contribution eligibility need to be distinguished more strongly — a policy-based
reject should be able to override a technically clean issue, not compete with it
as one factor among several.

**Check rationale**

From the final `rubric.md` in `tools/issue-select/`, the "Issue scope is bounded"
check:

> Pass if the issue describes one coherent bug, feature, or change that could
> reasonably be addressed in one focused pull request. Reject if it explicitly
> requires a repository-wide rewrite, major architecture redesign, broad
> migration, or multiple independent features.

This check is written around observable evidence — what the issue explicitly
describes (one change vs. a rewrite/migration/multiple features) — rather than
subjective words like "easy" or "small." A grader can point at concrete text in
the issue body that satisfies or fails the condition, instead of relying on a
gut feel for how big the work "seems."

**Trade-offs**

The rubric's "Investigation path exists" check passes an issue even when the
exact implementation files/functions are not already known, as long as there is
still a concrete way to begin investigating (an error message, affected
component, relevant file/module, or another identifiable entry point).

- Benefit: this avoids rejecting legitimate issues just because the
  implementation details are not pre-solved in the issue text — a real first
  issue often requires some investigation, and requiring it to already be fully
  scoped would reject issues that are otherwise good fits.
- Trade-off: some issues that pass this check may turn out to require more
  investigation than expected once a contributor actually opens the code, since
  "a concrete way to begin" is a lower bar than "the exact fix location is
  known."

---

## Selection rationale

Graded on whether all three are answered, in your own words. Not on how good the
reasoning is, and not on length — a short honest answer to each earns the full marks.
This is also the basis for the claim comment you write in Unit 2.

**Selection rationale**

1. **Fit to interests and time available.** #73 (README and `.env.example`
   disagree about which LLM API key to set) is a config/documentation-consistency
   fix — squarely inside my backend/config/debugging experience — and is
   estimated at 1-2 hours, which fits the time I actually have this week.

2. **What the verdict identified correctly, and what I weighed that the rubric
   could not.** The live run correctly identified that #73 passed every
   issue-level required check: it's unclaimed, narrowly scoped to two files, has
   a clear expected outcome (make `README.md` and `.env.example` agree on the
   `OPENROUTER_API_KEY` variable), and has a concrete investigation path (the
   exact files and the config module that defines both keys are named in the
   body). What the rubric couldn't weigh, because "Maintainer activity" is a
   repo-level fact applied uniformly, is that this repo's zero-merged-PR history
   is an artifact of it being a brand-new course section copy (created two weeks
   ago) rather than an abandoned or unmaintained project — commits are landing
   on `main` as recently as a week ago. I'm weighing that context myself rather
   than having the rubric account for it, since I chose not to revise the rubric
   for this submission.

3. **Anticipated difficulty in claiming it.** Low. It's a two-file textual
   consistency fix with no code logic to reason about and no dependency on
   unresolved external state, so the main risk is just making sure I don't
   introduce a third inconsistent spelling of the variable while reconciling the
   two files.

---

Related paths: `eval-run.txt` in this directory; your skill's files in
`tools/issue-select/`.
