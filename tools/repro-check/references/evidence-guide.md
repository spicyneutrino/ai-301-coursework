# Evidence guide: where proof lives in a reproduction package

## Environment

**Where it lives:** In an eval bundle, look for a dedicated "Environment:" label, a table of component versions, or the opening paragraph of the repro report before the steps. In live mode, look in the draft repro comment's environment section.

**What good looks like:** The OS and its version are named precisely (e.g., "Ubuntu 22.04 x86_64", "macOS 14.5 arm64", "Fedora 44") and the primary tool's version is stated specifically (e.g., "ripgrep 15.2.0", "bat 0.26.1"). If the issue mentions a key dependency — a library, runtime, driver, or browser — that component's version is also present. "My machine" or "latest" without a version number is not sufficient.

## Steps

**Where it lives:** In an eval bundle, the steps section of the repro report: numbered lists, code blocks with shell commands, or procedural prose. In live mode, the draft repro comment's steps or procedure section.

**What good looks like:** Steps start from a described state (a file created, a tool installed, a config applied) and list every command — including all flags — that a stranger needs to run to arrive at the failure. If the issue names a specific invocation syntax (e.g., offset-from-end range `:-N`, not a prefix range `N:`), the steps use that syntax. A step that depends on a private repository, private account, private config file, or any unshared resource fails this check even if the other steps are clear.

## Behavior shown

**Where it lives:** In an eval bundle, the artifact or output section of the repro report — code blocks containing command output, log lines, terminal captures, console messages, playground output panes, or screenshots. In live mode, the draft repro comment's artifact or output section.

**What good looks like:** The artifact is copy-pasted verbatim (not paraphrased) and captures the specific failure: the exact error message, exit code, crash output, or visual symptom the issue describes. An artifact that shows the program ran without error — version banner, normal output, session list — when the issue describes a crash, wrong output, or missing behavior does not satisfy this check. An honest "could not reproduce" with shown attempt artifacts (markers, log output from the attempt) and named environmental differences (what was different from the triggering conditions) is also good.

## Honesty

**Where it lives:** In an eval bundle, compare the "Expected" and "Actual" sections (or equivalent prose) in the repro report against the shown artifact. Also check whether any version or command deviation from the issue's stated trigger is acknowledged. In live mode, compare the draft's claims against the artifacts the draft shows.

**What good looks like:** The "Actual" description matches the artifact closely; any cannot-reproduce is stated explicitly ("I could not reproduce this on...") with the reason named; any environmental deviation from the issue's stated trigger (different version, different syntax, different OS) is called out rather than silently substituted. Bad: "reproduced the crash" when the artifact shows a different error or no crash; "expected" stated backwards from what the artifact shows; confident root-cause assertion ("I verified this race condition") with no supporting artifact; testing an older version than the issue targets without noting the difference.

## Comms

**Where it lives:** In an eval bundle, read the claim comment against the issue body and the repo-facts block (bug report template asks, contribution policy, AI use policy). In live mode, the draft claim comment against the same sources.

**What good looks like:** The claim comment names a specific reproduced behavior or investigation plan that matches the issue's described bug (not an adjacent bug). The repo's AI policy (if any) is followed: if the policy requires disclosing AI assistance in issue comments, the claim comment names the AI tool used and the extent of its help. Bad: interchangeable assign-me boilerplate promising a guaranteed fix by a deadline; a claim comment that reproduces or describes a different bug than the issue; a comment that omits required AI disclosure when the policy's language makes disclosure mandatory for any AI use.
