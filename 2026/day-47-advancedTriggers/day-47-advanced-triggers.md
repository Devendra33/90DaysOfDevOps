# Day 47 – Advanced Triggers: PR Events, Cron Schedules & Event-Driven Pipelines

## Overview
Today’s focus is on advanced GitHub Actions triggers:
- Pull request lifecycle events
- Scheduled workflows with cron
- Path and branch filters
- Chaining workflows with `workflow_run`
- External triggers with `repository_dispatch`

---

## Expected Output
- Several workflow files demonstrating advanced triggers
- A polished note file: `day-47-advanced-triggers.md`
- At least one scheduled workflow configured for your repo

---

## Challenge Tasks

### Task 1: Pull Request Event Types
Create `.github/workflows/pr-lifecycle.yml` with `pull_request` activity filters:
- `opened`
- `synchronize`
- `reopened`
- `closed`

Add steps to print:
- event action: `${{ github.event.action }}`
- PR title: `${{ github.event.pull_request.title }}`
- PR author: `${{ github.event.pull_request.user.login }}`
- source branch and target branch

Add a conditional step that runs only when the PR is merged:
- `if: github.event.pull_request.merged == true`

> Test: create a PR, push an update, then merge it. Confirm the workflow fires for each event type.

**Notes:** Created `pr-lifecycle.yml` on GitHub.

---

### Task 2: PR Validation Workflow
Create `.github/workflows/pr-checks.yml` as a PR gate for `main`.

Jobs:
- `file-size-check`
  - checkout code
  - fail if any PR file is larger than 1 MB
- `branch-name-check`
  - read `${{ github.head_ref }}`
  - fail if branch name is not `feature/*`, `fix/*`, or `docs/*`
- `pr-body-check`
  - read `${{ github.event.pull_request.body }}`
  - warn if the PR description is empty (but do not fail)

> Verify: open a PR from a badly named branch and confirm the branch-name check fails.

**Notes:** Created `pr-checks.yml` file on GitHub.

---

### Task 3: Scheduled Workflows (Cron Deep Dive)
Create `.github/workflows/scheduled-tasks.yml` with:
- `schedule` trigger `'30 2 * * 1'` (every Monday at 2:30 AM UTC)
- additional cron `'0 */6 * * *'` (every 6 hours)
- `workflow_dispatch` for manual testing

In the job:
- print the triggered schedule: `${{ github.event.schedule }}`
- run a health check with `curl` and verify the response code

Write answers in your notes:
- Cron for every weekday at 9 AM IST
- Cron for the first day of every month at midnight
- Why scheduled workflows may be delayed or skipped on inactive repos

**Notes:** Created `scheduled-tasks.yml` file on GitHub.

---

### Task 4: Path & Branch Filters
Create `.github/workflows/smart-triggers.yml` with:
- `push` trigger only when files in `src/` or `app/` change

Example:
```yaml
on:
  push:
    branches:
      - main
      - 'release/*'
    paths:
      - 'src/**'
      - 'app/**'
```

Create a second workflow using `paths-ignore` to skip runs when only docs change:
```yaml
on:
  push:
    branches:
      - main
      - 'release/*'
    paths-ignore:
      - '*.md'
      - 'docs/**'
```

> Test: push a `.md` change and confirm the workflow is skipped.

Notes:
- Use `paths` when you want to run only for specific files or directories.
- Use `paths-ignore` when the workflow should run normally unless only excluded files changed.

**Notes:** Created `smart-triggers.yml` file on GitHub.

---

### Task 5: `workflow_run` — Chain Workflows Together
Create two workflows:
1. `.github/workflows/tests.yml`
   - runs tests on every push
   - workflow name should be `Run Tests`
2. `.github/workflows/deploy-after-tests.yml`
   - triggers only after `Run Tests` completes

Example trigger:
```yaml
on:
  workflow_run:
    workflows:
      - 'Run Tests'
    types:
      - completed
```

In the deploy workflow:
- proceed only if `${{ github.event.workflow_run.conclusion == 'success' }}`
- print a warning and exit if the workflow failed

> Verify: a commit should run tests first and then trigger deployment only on success.

**Notes:** Created `tests.yml` (name: `Run Tests`) and `deploy-after-tests.yml` on GitHub.

---

### Task 6: `repository_dispatch` — External Event Triggers
Create `.github/workflows/external-trigger.yml` with:
- trigger: `repository_dispatch`
- event type: `deploy-request`
- print payload: `${{ github.event.client_payload.environment }}`

Trigger example:
```bash
gh api repos/<owner>/<repo>/dispatches \
  -f event_type=deploy-request \
  -f client_payload='{"environment":"production"}'
```

Write a note: when would an external system like Slack or monitoring trigger a pipeline?

**Notes:** Not doing this because its use case is less common.

---

## Hints
- PR merge check: `if: github.event.pull_request.merged == true`
- Cron syntax: `minute hour day-of-month month day-of-week`
- Scheduled workflows only run on the default branch
- `workflow_run` exposes the triggering workflow’s conclusion and artifacts
- `repository_dispatch` requires a personal access token with `repo` scope
- Path filters use glob patterns; `**` matches nested directories

---

## Documentation
Create `day-47-advanced-triggers.md` with:
- workflow YAML file references
- cron expressions from Task 3
- PR check screenshot evidence
- explanation of `workflow_run` vs `workflow_call`

---

## Submission
1. Add `day-47-advanced-triggers.md` to `2026/day-47/`
2. Commit and push to your fork

---

## Learn in Public
Share your PR validation workflow on LinkedIn — automated PR gates are a real DevOps flex.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**

