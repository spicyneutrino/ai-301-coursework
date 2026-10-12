# Procedure: grade a plan package

## Read order

1. Determine live or eval mode. In live mode read scope.md and voice-guide.md first and enforce the repo boundary. In eval mode use only the supplied bundle and ignore scope and voice.
2. Read the issue, thread highlights and repo facts. Record the requested behavior, maintainer constraints, contribution policy and any disclosure requirement.
3. Read the repro evidence before the candidate plan. Record inputs, environment, steps, observed and expected artifacts, and limits of the reproduction. This prevents a confident diagnosis from replacing actual observations.
4. Read the candidate plan and comment, including deviations. Then read every rubric row and the evidence guide before grading.

## Evidence gathering

1. For diagnosis and grounding, pair the plan's cause and its quoted or cited observation with the decisive repro artifact. In live mode fetch the issue and the student's posted repro using gh issue view or the GitHub API. Compare with the evidence quoted in the drafts; other working files cannot supply missing draft evidence.
2. For scope, list proposed files or areas, intended changes, exclusions and their relation to the issue. For cause-directed-change, trace how the operation removes the reproduced mechanism.
3. For executability, record the edit location, intended operation, sequence and prerequisites. Do not require a particular heading or exact line number. Accept a bounded subsystem plus concrete operation and debug/source tracing even if exact functions will be pinned later.
4. For tests, map each proposed check to a repro input or step, the affected real code or files, and an observable expected result. Identify regressions only where the bundle or live evidence shows shared behavior at risk.
5. For honesty, record hypotheses, unsupported certainty, material unknowns, their resolution or containment, and any deviation explanation.
6. For comms, compare the actual draft comment with maintainer requests and contribution rules. In live mode read docs/CONTRIBUTING.md through gh api and apply the classroom scope exceptions. Record required disclosure and check the named tool and extent. Also report voice-guide violations separately.

## Check execution

1. Execute rows in rubric order using the evidence gathered above. For each row quote or cite the specific artifact and apply its pass condition literally.
2. Grade pass when the condition is met, fail when contradicted or when required evidence is absent, and unclear when supplied evidence is ambiguous. Never fill a gap from assumed implementation details or unrelated working files.
3. Re-read only the relevant family if a comparison remains ambiguous. In eval mode never fetch external evidence. In live mode fetch missing issue-side facts, but do not invent missing draft content.
4. Continue through all rows even after a failure. Do not penalize concise plans for lacking headings, section counts or polish.

## Verdict assembly

1. Count every required fail and unclear as a blocking result. Accept only if all required checks pass; preferred checks do not decide the verdict.
2. Summarize each check with its deciding quote or fact. Report procedure gaps and live voice violations without silently adding new rubric requirements.
3. End with exactly the SKILL.md fenced JSON object containing item, checks with name/grade/evidence, and accept or reject. Put nothing after that block.
