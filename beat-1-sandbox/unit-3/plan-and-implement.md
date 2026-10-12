# Unit 3: Plan and Build

## Posted upstream

**GitHub username**

spicyneutrino

**Plan comment**

https://github.com/codepath/pathreview-ai301-fa26-s3/issues/73#issuecomment-6119075072

## Plan for #73

Building from [my Unit 2 reproduction](https://github.com/codepath/pathreview-ai301-fa26-s3/issues/73#issuecomment-5989037777) at `2f4e82f52efbcfcc57d65b3fa5348672163ca088`, on Bluefin 44.20260825 with Bash 5.3.9, Git 2.55.0 and grep 3.12:

```text
README.md:24:# Configure environment (add your OPENROUTER_API_KEY to .env)
.env.example:17:# Options: "mock" (default, no API key needed), "openai"
.env.example:18:LLM_PROVIDER=mock
.env.example:19:OPENAI_API_KEY=sk-your-key-here
docs/SETUP.md:47:# Edit .env and set your OPENROUTER_API_KEY (required for AI features)
OPENROUTER_API_KEY absent in copied example (grep exit 1)
```

The example omits the OpenRouter key that both setup instructions request. `core/config.py` defines the key, base URL and model fields; that does not establish runtime provider dispatch.

I propose updating the LLM block in `.env.example` to replace the incomplete provider-options list with guidance about the fields defined in `core/config.py`, without claiming an `openrouter` dispatch option, add a blank `OPENROUTER_API_KEY=`, and include commented optional base URL/model entries matching `core/config.py`. The existing mock default and OpenAI entry stay. In `README.md` and `docs/SETUP.md`, I propose clarifying that mock needs no key, OpenRouter uses `OPENROUTER_API_KEY` and OpenAI uses `OPENAI_API_KEY`. These are three edits for the same onboarding mismatch. Python code, provider behavior, dependencies and other setup settings are outside this change.

Verification: copy the real example to `.env` in a scratch directory and re-run my repro greps across the docs, example, copied file and config source. The missing-key message must become an `OPENROUTER_API_KEY=` match with exit 0; the example must describe the separate configuration fields without asserting provider-dispatch support; both docs must name matching keys and the no-key mock default. Also check that mock/OpenAI entries survive, optional defaults match the source, and `git diff --check` passes. Save literal before/after output. No live provider call is claimed or needed for this file comparison.

I plan to use `fix/73-llm-env-guidance` on my fork and a Conventional Commit, with only the three docs/config-example files committed. My independent plan follows the classroom rule allowing classmates to work on the same issue. Provider execution remains untested and outside this documentation fix.

AI assistance: Codex helped draft this plan and will edit the files and capture checks; Claude checks the draft using my installed plan-check skill.


## Your branch

**Branch**

fix/73-llm-env-guidance

Fork: https://github.com/spicyneutrino/pathreview-ai301-fa26-s3

**Evidence**

The before below was re-run on the same real files at the Unit 2 revision, `2f4e82f52efbcfcc57d65b3fa5348672163ca088`. The after uses the built change, commit `b09a8d7`. Both runs copy the real README, environment example, setup doc and config source into a temporary directory, then run the repro commands there. This avoids overwriting any configured `.env`. The Python capture script is kept locally at `assignment-2-work/verify-unit3.py`; it reads the real changed files and asserts the preserved settings and documentation agreement. No startup or provider-call result is claimed. This is a file-only documentation fix, so verification targets the changed files rather than installing unrelated runtime services.

Before:

```text
$ cp .env.example .env

[exit 0]
$ grep -nE 'OPENROUTER_API_KEY|OPENAI_API_KEY|LLM_PROVIDER|Options:' README.md .env.example .env docs/SETUP.md
README.md:24:# Configure environment (add your OPENROUTER_API_KEY to .env)
.env.example:17:# Options: "mock" (default, no API key needed), "openai"
.env.example:18:LLM_PROVIDER=mock
.env.example:19:OPENAI_API_KEY=sk-your-key-here
.env:17:# Options: "mock" (default, no API key needed), "openai"
.env:18:LLM_PROVIDER=mock
.env:19:OPENAI_API_KEY=sk-your-key-here
docs/SETUP.md:47:# Edit .env and set your OPENROUTER_API_KEY (required for AI features)
[exit 0]
$ grep -nE 'llm_provider|openai_api_key|openrouter' core/config.py
18:    llm_provider: str = Field(default="mock")
19:    openai_api_key: str = Field(default="")
20:    openrouter_api_key: str = Field(default="")
21:    openrouter_base_url: str = Field(default="https://openrouter.ai/api/v1")
22:    openrouter_model: str = Field(default="google/gemma-3-27b-it:free")
[exit 0]
$ grep -n OPENROUTER_API_KEY .env

[exit 1]
OPENROUTER_API_KEY absent in copied example (grep exit 1)
```

After:

```text
$ cp .env.example .env

[exit 0]
$ grep -nE 'OPENROUTER_API_KEY|OPENAI_API_KEY|LLM_PROVIDER|Options:' README.md .env.example .env docs/SETUP.md
README.md:25:# OpenRouter: OPENROUTER_API_KEY; OpenAI: OPENAI_API_KEY (see .env.example).
.env.example:20:LLM_PROVIDER=mock
.env.example:21:OPENAI_API_KEY=sk-your-key-here
.env.example:22:OPENROUTER_API_KEY=
.env:20:LLM_PROVIDER=mock
.env:21:OPENAI_API_KEY=sk-your-key-here
.env:22:OPENROUTER_API_KEY=
docs/SETUP.md:48:# OpenRouter: OPENROUTER_API_KEY; OpenAI: OPENAI_API_KEY (see .env.example).
[exit 0]
$ grep -nE 'llm_provider|openai_api_key|openrouter' core/config.py
18:    llm_provider: str = Field(default="mock")
19:    openai_api_key: str = Field(default="")
20:    openrouter_api_key: str = Field(default="")
21:    openrouter_base_url: str = Field(default="https://openrouter.ai/api/v1")
22:    openrouter_model: str = Field(default="google/gemma-3-27b-it:free")
[exit 0]
$ grep -n OPENROUTER_API_KEY .env
22:OPENROUTER_API_KEY=
[exit 0]
$ python3 verify-unit3.py [real-file assertions]
PASS: copied key, mock/OpenAI preserved, optional defaults match source, both docs agree
$ git diff --check

[exit 0]
```

`git diff --check` passed before committing. The committed diff contains only `.env.example`, `README.md` and `docs/SETUP.md`, with 11 insertions and 3 deletions. `plan.md` and `comment.md` remain untracked in the fork clone.

## Eval iterations

**Run history**

1. Initial full run: 19/20 agreement. Categories: clear-accept 6/7, scope-creep 4/4, thread-convention 2/2, unbuildable 3/3, wrong-cause 4/4. Only `pkg-14` disagreed, returning reject against gold accept. The initial transcript is preserved locally in `assignment-2-work/unit3-eval-initial.txt`.
2. Revised the evidence-grounded-cause, executable-approach and honest-uncertainty pass conditions to allow a reasoned mechanism and a bounded operation with concrete debug/source tracing, even when exact functions will be pinned during implementation. Updated the procedure and evidence guide accordingly. Targeted run with `--only pkg-14,pkg-01,pkg-10,pkg-04,pkg-20`: 5/5 agreement. `pkg-14` changed to accept; both thread-convention canaries and the wrong-cause/unbuildable canaries remained reject. A partial run did not replace eval-run.txt.
3. Confirming full run using the final installed files: 20/20 agreement. This is the harness-written `eval-run.txt` submitted here, without hand editing.

Final transcript lines:

```text
categories: clear-accept 7/7  scope-creep 4/4  thread-convention 2/2  unbuildable 3/3  wrong-cause 4/4
agreement: 20/20 scored items  (bar: 18/20: PASS)
```

Both full runs used the unmodified course harness with its pinned Sonnet model, the installed rubric, references/evidence-guide.md and adjacent procedure.md. No activity worksheet was available in this directory, so I wrote the diagnosis, scope and test checks from the assignment's fallback, then covered cause-directed edits, executability, uncertainty, and thread/contribution conventions. Live plan checks are separate from scored eval runs: the first accepted with a provider-option tension; the second rejected that wording under honest-uncertainty; after revising both drafts to document fields instead of asserting provider support, the third accepted before posting. The final check of the built plan, filled Deviations section and committed diff also returned accept.

**Package analysis**

`pkg-14`: the initial rubric returned reject, while the gold label is accept. The final rubric returned accept, matching gold. The package reproduces raw OSC responses on SSH reattach, with fresh-create and 0.44.1 controls remaining clean. Its proposed operation is concrete:

> "consuming or draining pending OSC query responses in the client attach path in `zellij-server`'s client connection handling before pane input is wired."

It defers exact functions but names an evidence-gathering method:

> "exact functions to be pinned in the PR after tracing the query issuance with debug logs, which I have working"

The tests require five clean SSH reattach cycles, fresh-create behavior and an always-clean cache control. The risk of swallowing a keystroke is contained by matching OSC response patterns instead of draining for a time window. My initial rules were too strict about stating a mechanism and deferring exact functions. The revised rules accept this bounded operation with concrete tracing, while still rejecting vague investigation-only plans. The final per-check results pass all seven checks.

**Check rationale**

The exact check row from the uploaded `tools/plan-check/rubric.md`:

```text
| executable-approach | Candidate files or areas, concrete edits, sequence, and prerequisites | Another contributor can start implementing from the named location and intended operation without asking what to change. Exact line numbers and exhaustive pseudocode are unnecessary; Pinning exact functions during implementation is allowed when the subsystem, intended operation and concrete tracing method are already named. Vague promises to investigate or fix without a concrete operation fail. | required |
```

I revised this check after pkg-14. The useful threshold is whether another contributor can begin a specific operation in a named subsystem, not whether every function name is already pinned. I rejected requiring exact line numbers or complete pseudocode because debugging may reasonably locate the final insertion point during implementation. The row still fails a promise to investigate without specifying an operation.

**Trade-offs**

The revised executable-approach check allows implementation to discover exact functions through an explicit tracing method. That can miss a plan whose named subsystem later turns out to be the wrong location; the evidence-grounded-cause and cause-directed-change checks reduce that risk but cannot execute the future trace. The targeted rerun tested the changed boundary on pkg-14 and held pkg-01, pkg-10, pkg-04 and pkg-20 as reject. The final full run then checked every package, including scope-creep cases omitted from the targeted run, and matched all 20. That is why the relaxation did not change other labels in this eval set.

AI assistance: Codex authored the installed checker files, drafted and revised the plan, edited the three project files and captured the real-file verification. Claude/Sonnet executed the course eval harness and the live plan checks. The submitted comment text is copied exactly from comment.md, and the GitHub comment body was verified against that file.
