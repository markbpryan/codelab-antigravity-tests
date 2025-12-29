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

It worked! *Looks like Gemini CLI in Cloud Shell is intended for darkmode :-)*

https://github.com/ryanmark1867/codelab-antigravity-tests/blob/main/experiments/media/2025-12-28_21-46-13.jpg

https://github.com/ryanmark1867/codelab-antigravity-tests/blob/main/experiments/media/2025-12-28_21-48-40.jpg

