# Day 39 — CI/CD Concepts

## Task 1: The Problem
A team of 5 developers manually deploying code to production can create many risks.

### 1. What can go wrong?
- Two developers can overwrite each other’s changes.
- Deployment steps can be missed or performed in the wrong order.
- Manual release notes or config changes may be inconsistent.
- Bugs can reach production because no automated test gate exists.
- Rollback is harder when deployments are not repeatable.

### 2. What does “it works on my machine” mean?
- It means the app runs in one developer’s local environment but fails elsewhere.
- The real problem is that each machine has different OS, libraries, environment variables, and installed tools.
- Without automation, the app may behave differently in staging or production than on the developer’s laptop.

### 3. How many times a day can a team safely deploy manually?
- A team can only deploy manually a few times a day safely.
- Manual deployment is slow, error-prone, and does not scale as the team grows.
- In practice, manual deploys are best used for rare emergency fixes or very small teams, not for regular releases.
- A healthy goal is to minimize manual deploys and automate as much as possible.

---

## Task 2: CI vs CD

### Continuous Integration
Continuous Integration means developers frequently merge code into a shared repository and automatically build and test every change. It catches integration bugs early by validating that new code works with the current codebase.

**Example:** A team pushes every feature branch to GitHub, and GitHub Actions runs `dotnet test` on every pull request.

### Continuous Delivery (with human intervention)
Continuous Delivery means every change is automatically built, tested, and packaged so it can be deployed to production at any time. Delivery stops short of automatic deployment, but the application is always in a deployable state.

**Example:** A pipeline builds a Docker image and stores it in a registry, while the release team decides when to deploy it to staging or production.

### Continuous Deployment (without human intervention)
Continuous Deployment means every successful change is released automatically to production without human intervention. It is used by teams that trust their automated tests and monitoring.

**Example:** A SaaS product pushes every passing commit to production after automated test and security checks.

---

## Task 3: Pipeline Anatomy

### Trigger
The trigger starts the pipeline. It can be a code push, a pull request, a merge to `main`, or a schedule.

### Stage
A stage is a logical phase such as build, test, or deploy. Stages group related jobs and often run in sequence.

### Job
A job is a unit of work inside a stage. Jobs run commands or actions, and may run in parallel with other jobs in the same stage.

### Step
A step is one command or action within a job, such as `dotnet restore`, `docker build`, or `npm test`.

### Runner
The runner is the machine or container that executes the job. It may be hosted by the CI provider or self-managed by the team.

### Artifact
An artifact is the output produced by a job, such as a compiled binary, Docker image, test report, or deployment package.

---

## Task 4: Pipeline Diagram
A CI/CD pipeline for the scenario where code is pushed to GitHub, tested, built into a Docker image, and deployed to staging.

```text
GitHub Push
    |
    v
[Trigger]
    |
    v
[Build Stage]
    |-- restore dependencies
    |-- compile code
    |-- build Docker image
    |
    v
[Test Stage]
    |-- run unit tests
    |-- run integration tests
    |-- run lint/static analysis
    |
    v
[Publish Stage]
    |-- push Docker image to registry
    |-- upload build artifacts
    |
    v
[Deploy Stage]
    |-- deploy image to staging
    |-- run smoke tests
    |-- notify team
```

### Pipeline stages explained
- **Build Stage:** compile the app and create the Docker image.
- **Test Stage:** validate code quality and catch regressions before deployment.
- **Publish Stage:** publish the Docker image and any required artifacts.
- **Deploy Stage:** deploy the built image to the staging environment and verify it.

---
## Task 5: Explore in the Wild
Choose a popular open-source project and inspect one workflow file in its `.github/workflows/` folder.

### Project inspected
- **Repository:** `facebook/react`
- **Workflow file:** `compiler_discord_notify.yml`
- **Link:** https://github.com/facebook/react/blob/main/.github/workflows/compiler_discord_notify.yml

### What triggers it?
```yaml
on:
  pull_request_target:
    types: [opened, ready_for_review]
    paths:
      - compiler/**
      - .github/workflows/compiler_**.yml
```

- This workflow triggers when a pull request is opened or marked ready for review.
- It only runs if the changed files are under `compiler/**` or if the workflow files matching `.github/workflows/compiler_**.yml` are modified.

### How many jobs does it have?
- The workflow has **3 jobs**.

### What does it do?
- It appears to notify the React Discord community about compiler-related pull requests.
- It checks whether the PR is open or ready for review and whether relevant compiler files changed.
- It likely posts a message or alert so reviewers can pay attention to important compiler changes.

---
## Summary
CI/CD exists to reduce risk, catch errors early, and make deployments repeatable. Manual deploys are slow and unsafe at scale, while pipelines automate the steps and make software delivery faster and more reliable.
