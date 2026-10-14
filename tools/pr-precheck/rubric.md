# Rubric: is this PR ready to submit?

## Checks

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| Plan fidelity | Plan context and deviations against every diff hunk and description claim | Every material addition or omission matches the plan or an explicit explanation of what changed and why. Honest bounded shortfalls pass. Silent scope changes or false fidelity claims fail. | required |
| Observable verification | Test plan and repro against candidate test evidence | Evidence reports concrete commands, inputs, and observed results from the affected real files or code. A clear reported control result or suite result is evidence even without a full transcript. It demonstrates the changed behavior, or explicitly identifies a bounded unverified shortfall without claiming success. Toy stand-ins, future test promises, and unsupported "works" claims fail. | required |
| Repository checks | Repo facts or contribution checks against test evidence and Testing claims | Required local checks ran with reported results. Accept explicit formatting or check attestations without requiring separate command transcripts. Disclosed failures or unavailable checks include a specific reason and do not masquerade as passes. No applicable stated checks means this check passes. Pending post-opening CI does not block a draft. | required |
| Focused diff | All diff hunks and commits against issue scope | Changes serve the issue. No unrelated cleanup, debug debris, abandoned commented code, or generated noise obscures review. Necessary optional configuration comments are not debris. | required |
| Faithful description | Title and description against diff and test evidence | Text accurately states behavior, limits, and test outcomes. It identifies the issue and lets a reviewer understand the actual change. Disclosed omissions pass. Material unsupported behavior claims fail. Do not treat contextual shorthand, possible future policy, or unquoted formatting commands as contradictions. | required |
| Stated standards | Repo facts, PR template and contribution policy against description | Applicable template asks and AI disclosure requirements are satisfied in substance. Do not invent a template or AI policy. Explain applicable N/A sections. Respect classroom exceptions and pending CI rules. | required |
| Review guidance | Description and risk notes | Reviewer can locate the main change and understand material risks without unrelated narrative. | preferred |

## Verdict rule

Accept only when every required check passes. Reject if any required check fails or is unclear. Preferred checks never change the verdict.
