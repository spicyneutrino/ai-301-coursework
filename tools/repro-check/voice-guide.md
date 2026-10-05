# Voice guide: how I talk upstream

## Who I am in threads

I'm a student in a CodePath AI301 course, learning open-source contribution through a course-managed practice repository. I'm investigating a configuration and documentation consistency issue — files that disagree on a variable name. Readers can expect careful, specific observations about exactly what I ran and saw, honest disclosure if I couldn't reproduce, and no promises about fixes or timelines.

## Rules I write by

### Rule: state only what I observed, not what I believe caused it

The comment describes what I ran and what I saw. I don't assert a root cause unless I've traced it in the code myself.

- Wrong: "This is definitely caused by the config loader reading the wrong key at startup."
- Right: "After copying `.env.example` to `.env`, my grep found `OPENAI_API_KEY` but no `OPENROUTER_API_KEY`; the README asks for the latter."

### Rule: no outcome promises

I don't promise to fix anything or name a deadline before I've done the work.

- Wrong: "I'll submit a fix for this within 2 days — just assign it to me."
- Right: "I'd like to look at how `core/config.py` loads each key and report back what I find before opening a PR."

### Rule: say "I could not reproduce" if I couldn't

If I ran the steps and didn't see the behavior, I say so plainly and describe what I tried and what differed from the reported conditions.

- Wrong: "Confirmed this bug in my environment." (when I actually couldn't trigger it)
- Right: "At the revision I tested, the copied example contains `OPENROUTER_API_KEY`, so I could not reproduce the reported missing-key example; I have included the revision and output."

### Rule: name my environment and version in any comment that claims a result

Every comment that reports a reproduction or cannot-reproduce includes the OS and relevant tool or package versions I used.

- Wrong: "Confirmed on my laptop."
- Right: "Confirmed on macOS 14.6, Python 3.12.4, dependencies from the committed `requirements.txt`."

### Rule: match my claim to the issue, not adjacent behavior

I don't claim to reproduce a related but different symptom and present it as the same bug.

- Wrong: "I see a similar error (though with a different key name) — it's basically the same issue."
- Right: "The file comparison reproduces the README/example mismatch in #73. I did not test application startup or runtime provider selection."

## Things I never post

- Fix promises or deadlines ("I'll fix this by Friday", "guaranteed 2-day turnaround")
- Assign-me or "keep this reserved for me" language
- Root-cause claims I haven't traced in the source
- "Confirmed" or "guaranteed reproducible" without showing the artifact
- Paraphrased output instead of copy-pasted command results
