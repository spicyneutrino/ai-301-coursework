# Evidence guide

## Plan fidelity

Eval: compare Plan context, including repro and deviations, with Candidate PR Diff and Description. Live: compare plan.md and Deviations with git diff main...HEAD and pr_draft.md. Good evidence accounts for each material operation and omission. An explicit bounded deviation explains what changed and why. A description cannot silently redefine the plan.

## Test evidence

Eval: compare Plan context Test plan and Repo facts with Candidate PR Test evidence and Description. Live: compare plan.md with test_evidence.md and the Testing section in pr_draft.md. Good evidence contains actual commands and observed before/after results on affected artifacts. Record repository checks and exit outcomes. A disclosed failure differs from an unrun check falsely claimed as passing. A toy implementation does not test the actual change.

## Diff quality

Eval: inspect all Candidate PR Diff hunks and Commits against Issue and Plan context. Live: inspect the complete committed branch diff and git log main..HEAD. Good evidence shows a focused change without debug output, abandoned code, unrelated refactors, or generated clutter. Judge relevance rather than a fixed line or commit count.

## Standards and comms

Eval: read Repo facts for template asks and contribution or AI policy. Compare those asks with Candidate PR Title and Description. Live: read the issue thread, .github/PULL_REQUEST_TEMPLATE.md, and docs/CONTRIBUTING.md. Compare with pr_draft.md and test_evidence.md. Good text identifies the issue, describes the diff accurately, reports tests honestly, and supplies required AI disclosure. N/A needs a reason when applicable. Do not infer unstated policies. Live voice-guide.md governs wording separately.
