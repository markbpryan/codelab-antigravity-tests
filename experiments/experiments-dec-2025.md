# EXPERIMENT 1

Run https://codelabs.developers.google.com/codelabs/cloud-run/how-to-deploy-a-secure-mcp-server-on-cloud-run with basic prompt and rules

## PREP:
- Define rules for Antigravity to follow by getting Antigravity to define its own rule for reasonable actions to take to mimic a journeyman user.
- Confirm that browser opens correctly
    - open https://codelabs.developers.google.com/codelabs/cloud-run/how-to-deploy-a-secure-mcp-server-on-cloud-run in your browser
- log into browser and console
- define fresh project
    - PROJECT_ID: test-codelabs-dec-2025
    - PROJECT_NUMBER: 632816321420
    - REGION: us-central1

## PROMPT:

```
Complete the steps in https://codelabs.developers.google.com/codelabs/cloud-run/how-to-deploy-a-secure-mcp-server-on-cloud-run up to and including https://codelabs.developers.google.com/codelabs/cloud-run/how-to-deploy-a-secure-mcp-server-on-cloud-run#7. Use:
    - PROJECT_ID: test-codelabs-dec-2025
    - PROJECT_NUMBER: 632816321420
    - REGION: us-central1
```

## RESULTS:

Failed for a couple of reasons:
- new project could not be associated with a billing account (needed me to up quota)
- it defaulted to running steps locally rather than in Cloud Shell. For the purposes of getting past this, need to simply hardcode using Cloud Shell into the prompt but it really should work because this step https://codelabs.developers.google.com/codelabs/cloud-run/how-to-deploy-a-secure-mcp-server-on-cloud-run#2 clearly states that the codelab is to be run in CLoud Shell, plus it really reduces the amount of variability to use Cloud Shell rather than a local environment.

# EXPERIMENT 2

Apply lessons learned from experiment 1:
- use project that has billing enabled

Run https://codelabs.developers.google.com/codelabs/cloud-run/how-to-deploy-a-secure-mcp-server-on-cloud-run with basic prompt and rules

## PREP:
- log into browser and select project with billing enabled
- define fresh project
    - PROJECT_ID: test-antigravity-dec-2025
    - PROJECT_NUMBER: 870738545502
    - REGION: us-central1

## PROMPT:

```
Complete the steps in https://codelabs.developers.google.com/codelabs/cloud-run/how-to-deploy-a-secure-mcp-server-on-cloud-run up to and including https://codelabs.developers.google.com/codelabs/cloud-run/how-to-deploy-a-secure-mcp-server-on-cloud-run#7. Use:
    - PROJECT_ID: test-antigravity-dec-2025
    - PROJECT_NUMBER: 870738545502
    - REGION: us-central1
The commands in this codelab need to be run in Cloud Shell, not locally. You can use:

gcloud alpha cloud-shell get-environment

to confirm access to the Cloud Shell environment (you'll get "running" response to confirm) and then use this pattern run subsequent commands in Cloud Shell:

gcloud cloud-shell ssh --command="..."
```

## RESULTS:

It worked! With the prompt above, it got all the way through the codelab and including the MCP server working in Gemini CLI. I manually verified that the MCP server was working by invoking it in Gemini CLI in Cloud Shell.

https://github.com/ryanmark1867/codelab-antigravity-tests/blob/main/experiments/media/2025-12-28_21-46-13.jpg

https://github.com/ryanmark1867/codelab-antigravity-tests/blob/main/experiments/media/2025-12-28_21-48-40.jpg

## LESSONS LEARNED:

- Since the idea isn't to test how smoothly Antigravity can run commands in Cloud Shell, for Codelabs where the user is expected to run commands in Cloud Shell, include the hints in the prompt (or maybe set up a rule for Cloud Shell-centric runs and set it on by default).
- First time through testing a codelab, it's imporant to monitor it manually and approve every action. However, I can see for subsequent runs, once it has successfully run once, consider Settings -> Terminal Command Auto Execution or Allowlist to allow it to run without manual approval https://github.com/ryanmark1867/codelab-antigravity-tests/blob/main/experiments/media/2025-12-28_22-08-10.jpg.
- Need to think about automating "the last mile". For example, in this run, it got to the end, but it didn't attempt the validation (perhaps because it was really complex / impossible to instrument using the Cloud Shell command line interface). Depending on the preferences of the codelab verifier, we may want to nudge Antigravity to attempt the validation automatically so that we get to the goal of end-to-end completion of a codelab "hands off".
- ID_TOKEN is not persistent, so need to refresh in subsequent runs or will get an "oauth not authenticated" message when trying to re-run. Overall point is that Antigravity getting successfully through the codelab once doesn't mean that the end result will work flawlessly on repeated tries.

# EXPERIMENT 3

Build on success of Experiment 2 and try the related codelab that has the codelab from experiment 2 as a prerequisite: https://codelabs.developers.google.com/codelabs/cloud-run/use-mcp-server-on-cloud-run-with-an-adk-agent

## PREP:
- experiment 2 completed and outcome of that experiment still available
- log into browser and select project with billing enabled
- define fresh project
    - PROJECT_ID: test-antigravity-dec-2025
    - PROJECT_NUMBER: 870738545502
    - REGION: us-central1

## PROMPT:

```
Complete the steps in https://codelabs.developers.google.com/codelabs/cloud-run/use-mcp-server-on-cloud-run-with-an-adk-agent up to and including https://codelabs.developers.google.com/codelabs/cloud-run/use-mcp-server-on-cloud-run-with-an-adk-agent#8. Use:
    - PROJECT_ID: test-antigravity-dec-2025
    - PROJECT_NUMBER: 870738545502
    - REGION: us-central1
The commands in this codelab need to be run in Cloud Shell, not locally. You can use:

gcloud alpha cloud-shell get-environment

to confirm access to the Cloud Shell environment (you'll get "running" response to confirm) and then use this pattern run subsequent commands in Cloud Shell:

gcloud cloud-shell ssh --command="..."
```
