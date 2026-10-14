# Unit 4: Test and submit

## Your pull request

**Pull request**

https://github.com/codepath/pathreview-ai301-fa26-s3/pull/233

**Branch**

`fix/73-llm-env-guidance`

## Eval iterations

**Run history**

1. Full run: 16/20. Every category had a match. The misses were pkg-05, pkg-08, pkg-16, and pkg-19.
2. Partial run: 7/7 on pkg-05, pkg-08, pkg-16, pkg-19 and canaries pkg-01, pkg-03, pkg-04. This was a revision check, not a full score.
3. Final full run: 20/20. Categories: clear-accept 7/7, not-tested 4/4, silent-drift 4/4, standards-wall 2/2, unreviewable 3/3. This matches the saved eval-run.txt.

I revised the rubric to accept explicit control and formatting results without requiring a transcript for each one. I also distinguished material behavior contradictions from contextual shorthand. The procedure now treats frozen diffs as excerpts and does not infer omitted helper behavior.

**Package analysis**

pkg-19: my initial verdict was reject, while the gold label was accept. My revised and final verdict was accept, matching gold. The package shows the actual issue input before and after. Its diff command prints "IDENTICAL". It also reports "Controls (double-quoted twin; single-quoted without the trailing blank line) unchanged" and "go test ./... passes (4108 tests)." My initial check demanded commands and output for every control. That requirement discounted explicit observed results. The revised check accepts the control report while still requiring evidence on the actual affected artifact. The focused emitter change and regression test match the plan.

**Check rationale**

The current check reads exactly:

| Observable verification | Test plan and repro against candidate test evidence | Evidence reports concrete commands, inputs, and observed results from the affected real files or code. A clear reported control result or suite result is evidence even without a full transcript. It demonstrates the changed behavior, or explicitly identifies a bounded unverified shortfall without claiming success. Toy stand-ins, future test promises, and unsupported "works" claims fail. | required |

I revised this check after pkg-19. The main reproduction needs observable evidence from the real artifact. A control result can still be evidence without a full terminal transcript. This rule rejects toy replacements and future promises without rejecting a concise report of actual checks.

**Trade-offs**

Accepting explicit result reports means the skill cannot establish whether someone fabricated a reported control or formatting result. Requiring complete transcripts would not prevent fabrication either. The skill checks consistency and relevance, rather than claiming independent execution. I repeated pkg-01, pkg-03, and pkg-04 as canaries after loosening the checks. All retained their reject verdicts. The final full run also retained both standards-wall rejects and every not-tested reject.
