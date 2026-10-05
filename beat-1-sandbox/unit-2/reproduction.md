# Unit 2 — Claim and Reproduce

## Your identity upstream

**GitHub username**

spicyneutrino

## Posted upstream

**Claim comment**

https://github.com/codepath/pathreview-ai301-fa26-s3/issues/73#issuecomment-5989005394

I’m investigating #73 for AI301. The issue describes `README.md` asking for `OPENROUTER_API_KEY` while `.env.example` lists `OPENAI_API_KEY` and only `mock`/`openai` provider options. I’ll clone my fork, follow the documented environment-copy step, compare those files with `core/config.py`, and post my own report with the code revision, commands, and observed result, including if I cannot reproduce the mismatch.

I’m using AI assistance to draft and check the comments and organize the investigation. I’ll report only what the commands actually show.

**Reproduction comment**

https://github.com/codepath/pathreview-ai301-fa26-s3/issues/73#issuecomment-5989037777

## Reproduction report for #73

**Outcome:** Reproduced the documentation/example configuration mismatch.

**Environment:** Bluefin 44.20260825 (Fedora Silverblue, x86_64); GNU Bash 5.3.9; Git 2.55.0; GNU grep 3.12. Fork: https://github.com/spicyneutrino/pathreview-ai301-fa26-s3, branch `main`, commit `2f4e82f52efbcfcc57d65b3fa5348672163ca088`. Tracked working tree was clean before and after the check. Python 3.14.7 is installed but was not used for this file-only reproduction.

**Steps from a fresh checkout:**

```bash
git clone https://github.com/spicyneutrino/pathreview-ai301-fa26-s3.git
cd pathreview-ai301-fa26-s3
git checkout --detach 2f4e82f52efbcfcc57d65b3fa5348672163ca088
git rev-parse HEAD
cp .env.example .env
grep -nE 'OPENROUTER_API_KEY|OPENAI_API_KEY|LLM_PROVIDER|Options:' README.md .env.example .env docs/SETUP.md
grep -nE 'llm_provider|openai_api_key|openrouter' core/config.py
grep -n 'OPENROUTER_API_KEY' .env || echo 'OPENROUTER_API_KEY absent in copied example (grep exit 1)'
git status --short
```

The `cp` command is the environment configuration step in the README and `docs/SETUP.md`. No dependencies, API key, backing services, or application startup are needed to observe this textual mismatch. Use a fresh checkout so copying the example does not overwrite a configured `.env`.

**Actual output from my checkout:**

```text
$ git rev-parse HEAD
2f4e82f52efbcfcc57d65b3fa5348672163ca088
$ cp .env.example .env
$ grep -nE "OPENROUTER_API_KEY|OPENAI_API_KEY|LLM_PROVIDER|Options:" README.md .env.example .env docs/SETUP.md
README.md:24:# Configure environment (add your OPENROUTER_API_KEY to .env)
.env.example:17:# Options: "mock" (default, no API key needed), "openai"
.env.example:18:LLM_PROVIDER=mock
.env.example:19:OPENAI_API_KEY=sk-your-key-here
.env:17:# Options: "mock" (default, no API key needed), "openai"
.env:18:LLM_PROVIDER=mock
.env:19:OPENAI_API_KEY=sk-your-key-here
docs/SETUP.md:47:# Edit .env and set your OPENROUTER_API_KEY (required for AI features)
$ grep -nE "llm_provider|openai_api_key|openrouter" core/config.py
18:    llm_provider: str = Field(default="mock")
19:    openai_api_key: str = Field(default="")
20:    openrouter_api_key: str = Field(default="")
21:    openrouter_base_url: str = Field(default="https://openrouter.ai/api/v1")
22:    openrouter_model: str = Field(default="google/gemma-3-27b-it:free")
$ grep -n OPENROUTER_API_KEY .env
OPENROUTER_API_KEY absent in copied example (grep exit 1)
$ git status --short
```

**Expected:** The README and example environment file should give consistent configuration guidance for the key the setup instruction tells users to add.

**Observed:** `README.md:24` asks for `OPENROUTER_API_KEY`; `.env.example:17-19` lists only mock/openai and `OPENAI_API_KEY`. Copying the example preserves that omission. `core/config.py:20` defines an OpenRouter key field. The related setup instruction at `docs/SETUP.md:47` repeats the README guidance.

**Limits:** I stopped after the documented environment-copy step. I did not start Docker, install application dependencies, start the app, load Settings, or call a provider. These results establish the file inconsistency in #73, not a runtime crash or whether `openrouter` is a supported `LLM_PROVIDER` value. No source files were changed.

**AI assistance:** Codex helped draft the commands and report; Claude checked the comment package with my installed repro-check skill, and DeepSeek audited the assignment requirements. The output above comes from executing the commands in my own fork checkout.

## Eval iterations

**Run history**

1. Initial complete run with the installed rubric and evidence guide: 20/20 agreement. All five categories matched. The original harness used its pinned `sonnet` model and saved per-check results to `results.json`.
2. Confirming complete run with `--save-run eval-run.txt`: 20/20 agreement. No rubric or evidence revisions were needed between the two runs; there were no disagreements to re-grade with `--only`.

The final harness-written line is:

> `agreement: 20/20 scored items  (bar: 18/20: PASS)`

And its category line is:

> `categories: clear-accept 8/8  disclosure 1/1  no-evidence 4/4  unfollowable-comms 3/3  wrong-target 4/4`

Both runs used `~/.claude/skills/repro-check/rubric.md` and `~/.claude/skills/repro-check/references/evidence-guide.md`. The submitted copies are identical to these canonical files. The voice guide was later corrected to use file-mismatch examples rather than hypothetical startup errors; eval ignores the voice guide. Claim-only and full-package live checks both returned `accept` before the corresponding comment was posted. Those live checks are not scored eval runs.

**Package analysis**

`pkg-20`: my rubric returned `reject`; the gold label is `reject`. The initial per-check result reports `failed_checks: ["ai-disclosure"]`; every other check passed. The package's repo facts say, "All AI usage in any form must be disclosed, stating the tool used and the extent of the assistance." Neither candidate comment supplies that disclosure. This is a technically convincing reproduction that still fails the stated contribution policy. The required disclosure check prevents technical completeness from overriding a policy requirement.

**Check rationale**

The complete check row, copied exactly from the submitted `tools/repro-check/rubric.md`:

```text
| ai-disclosure | The contribution policy section of the repo-facts block, read against both the claim comment and the repro report | If the repo's stated policy requires disclosure of AI assistance in issue comments (naming the tool and extent of use), the comments must include that disclosure. Passes if the policy has no AI disclosure requirement, permits AI without requiring disclosure, or the comments explicitly name the AI tool used and the extent of assistance. Fails if the policy requires disclosure and neither comment discloses AI use. | required |
```

I chose a conditional policy check rather than requiring an AI disclosure in every evaluation package. That preserves acceptance for repositories with silent or permissive policies while making an explicit disclosure requirement decisive. I rejected treating conventions as optional because `pkg-20` should be held even when all technical proof is present. The first and confirming runs both matched this category, so no revision to this check was needed.

**Trade-offs**

The `behavior-match` pass condition includes: "or the report explicitly states it could not reproduce and names the specific environmental condition that differed." This allows evidence-backed negative results instead of rewarding only successful reproductions. It relies on the report's artifacts and environment being honest; it cannot independently detect fabricated output or prove that a named environmental difference caused a failure to reproduce. That limitation is preferable to forcing unsupported reproduction claims. No checks were loosened after the initial full run, so no targeted canary rerun was required. The two complete runs matched `pkg-20` (`reject`) as well as permissive-policy `pkg-05` and `pkg-09` (`accept`), supporting the choice not to make disclosure universally mandatory.

## Reflection

The issue was specific enough to reproduce without starting the application: the copied environment example and README give different key guidance. Comparing `core/config.py` added context but did not establish runtime provider support. The report therefore limits its conclusion to the documented mismatch. My claim promised an investigation and report, and my own output supports the result I posted. Other students' comments did not block my claim or replace my evidence.

AI assistance: Codex coordinated the work and drafted this write-up; Claude helped create and evaluate the checker; DeepSeek audited the assignment requirements. The eval file is the original harness-written transcript, and the reproduction output came from commands executed against my fork.
