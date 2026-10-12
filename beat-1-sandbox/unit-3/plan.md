# Plan for issue #73

Issue: https://github.com/codepath/pathreview-ai301-fa26-s3/issues/73
Fork: https://github.com/spicyneutrino/pathreview-ai301-fa26-s3
Branch: fix/73-llm-env-guidance

## Diagnosis and reproduced evidence

My Unit 2 report is https://github.com/codepath/pathreview-ai301-fa26-s3/issues/73#issuecomment-5989037777. On Bluefin 44.20260825, Bash 5.3.9, Git 2.55.0 and grep 3.12, at commit 2f4e82f52efbcfcc57d65b3fa5348672163ca088, copying the real example produced this output:

```text
README.md:24:# Configure environment (add your OPENROUTER_API_KEY to .env)
.env.example:17:# Options: "mock" (default, no API key needed), "openai"
.env.example:18:LLM_PROVIDER=mock
.env.example:19:OPENAI_API_KEY=sk-your-key-here
docs/SETUP.md:47:# Edit .env and set your OPENROUTER_API_KEY (required for AI features)
OPENROUTER_API_KEY absent in copied example (grep exit 1)
```

The cause of the textual mismatch is the omitted OpenRouter configuration in the example, paired with unconditional key guidance in the setup docs. core/config.py defines openrouter_api_key, openrouter_base_url and openrouter_model, but these fields do not establish provider dispatch or a successful API call. My reproduction did not test startup.

## Scope and files

Change .env.example's LLM configuration block, README.md's environment instruction and the matching instruction in docs/SETUP.md. Add the missing OpenRouter key entry, replace the incomplete provider-options list with guidance about the defined configuration fields, and preserve mock as the default and the existing OpenAI entry. Clarify that mock needs no key and that each service has its own key. These three edits address the same onboarding inconsistency.

Exclude Python code, dispatch behavior, provider implementation, database settings, dependencies, unrelated docs and frontend changes. Do not claim this documentation change makes live AI calls work. No API key or network service is needed to check this issue.

## Approach

1. Create fix/73-llm-env-guidance from the reproduced main revision in my fork. Keep plan.md and comment.md untracked and out of commits.
2. In .env.example, replace the options comment with field guidance referring to core/config.py, without claiming an openrouter dispatch option, add OPENROUTER_API_KEY= with no credential, and add commented optional OPENROUTER_BASE_URL and OPENROUTER_MODEL entries using the exact defaults from core/config.py. Preserve LLM_PROVIDER=mock and OPENAI_API_KEY=sk-your-key-here.
3. In README.md and docs/SETUP.md, replace the unconditional OpenRouter-key instruction with guidance that mock needs no key, OpenRouter uses OPENROUTER_API_KEY and OpenAI uses OPENAI_API_KEY. Do not change setup commands.
4. Read each diff, re-run the file reproduction below, and commit only those three files with a Conventional Commit. Push to my fork. A PR follows in Unit 4.

## Test plan

Use a scratch copy of the real checkout files so cp cannot overwrite a configured .env. Run the same Unit 2 commands inside that scratch copy:

```bash
cp .env.example .env
grep -nE 'OPENROUTER_API_KEY|OPENAI_API_KEY|LLM_PROVIDER|Options:' README.md .env.example .env docs/SETUP.md
grep -nE 'llm_provider|openai_api_key|openrouter' core/config.py
grep -n 'OPENROUTER_API_KEY' .env || echo 'OPENROUTER_API_KEY absent in copied example (grep exit 1)'
```

Before: the missing-key message above and only mock/openai in the options. After: the final grep returns an OPENROUTER_API_KEY= line with exit 0, the example explains the separate OpenAI and OpenRouter fields without asserting provider-dispatch support, and both setup instructions name the matching keys and mock's no-key default. Verify LLM_PROVIDER=mock and the existing OpenAI entry survive, and optional base URL/model match the source defaults. Save commands and literal before/after output. Run git diff --check. These checks read the actual changed files, not a model of the bug. No code or UI changes require runtime tests for this file-only result.

## Risks and unknowns

A Settings string and field names do not prove runtime provider support; this change documents configuration and leaves dispatch behavior unverified and outside scope. Optional defaults may change later, so copy the current source values rather than inventing them. Keep credentials blank or placeholders. Other students' plans do not replace my independent evidence or block this classroom contribution. Follow CONTRIBUTING's branch and Conventional Commit rules.

AI assistance: Codex drafted the plan and will edit the docs and capture checks; Claude grades the plan using my installed plan-check skill. This is a proposed change, with no delivery-date or runtime-success promise.

## Deviations

The build followed the posted plan: the example now includes a blank OpenRouter key and commented optional defaults, and both setup instructions explain the separate keys and the mock default. No files or runtime behavior were added to the scope. The provider-options wording was revised before posting to describe configuration fields, so there was no deviation from the posted plan.
