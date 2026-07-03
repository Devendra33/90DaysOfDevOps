# Day 46 — Reusable Workflows

## Task 1: Understand `workflow_call`

### What is a reusable workflow?
A reusable workflow is a GitHub Actions workflow that can be called by other workflows. It allows you to define common CI/CD logic once and reuse it across multiple repositories or workflows.

Benefits:
- Reduces duplication
- Easier maintenance
- Consistent CI/CD processes
- Centralized updates

Example use cases:
- Standard build process
- Security scanning
- Docker image publishing
- Deployment workflows

### What is the `workflow_call` trigger?
The `workflow_call` trigger allows a workflow to be invoked by another workflow.
Unlike `push` or `pull_request`, a workflow with `workflow_call` does not run automatically from Git events — it runs only when another workflow calls it.

It can accept arguments as inputs.

Example:
```yaml
on:
  workflow_call:
    inputs:
      environment:
        required: true
        type: string
```

### How is calling a reusable workflow different from using a regular action (`uses:`)?

| Reusable Workflow                                           | Action                                                        |
| ----------------------------------------------------------- | ------------------------------------------------------------- |
| Contains one or more jobs                                   | Contains steps or logic                                       |
| Called at the job level                                     | Called at the step level                                      |
| Can define runners, permissions, outputs, and multiple jobs | Executes within an existing job                               |
| Stored as a workflow YAML file                              | Stored as an action (JavaScript, Docker, or Composite Action) |

Example reusable workflow call:
```yaml
jobs:
  build:
    uses: owner/repo/.github/workflows/build.yml@main
```

Example action usage:
```yaml
steps:
  - uses: actions/checkout@v4
```

### Where must a reusable workflow file live?
A reusable workflow must live in `.github/workflows/` and include:
```yaml
on:
  workflow_call:
```

---

## Task 2: Create Your First Reusable Workflow

Create `.github/workflows/reusable-build.yml` with:
1. `on: workflow_call`
2. `inputs:`
   - `app_name` (string, required)
   - `environment` (string, required, default: `staging`)
3. `secrets:`
   - `docker_token` (required)
4. A job that:
   - checks out the code
   - prints `Building <app_name> for <environment>`
   - prints `Docker token is set: true` (never print the actual secret)

> Verify: This file alone won't run — it needs a caller.

---

## Task 3: Create a Caller Workflow

Create `.github/workflows/call-build.yml`:
1. Trigger on push to `main`
2. Add a job that uses the reusable workflow:

```yaml
jobs:
  build:
    uses: ./.github/workflows/reusable-build.yml
    with:
      app_name: "my-web-app"
      environment: "production"
    secrets:
      docker_token: ${{ secrets.DOCKER_TOKEN }}
```

3. Push to `main` and watch it run.

> Verify: In the Actions tab, confirm the caller workflow ran and the inputs are printed.

---

## Task 4: Add Outputs to the Reusable Workflow

Extend `reusable-build.yml`:
1. Add an `outputs:` section exposing `build_version`
2. Generate a version string inside the job, e.g. `v1.0-<short-sha>`, and set it as output
3. In the caller workflow, add a second job that:
   - depends on the build job (`needs:`)
   - reads and prints the `build_version` output

> Verify: The second job should print the version from the reusable workflow.

### Notes
- Answer: Created `reusable-build.yml` and `call-build.yml` file (great example to look for revision).

---

## Task 5: Create a Composite Action

Create `.github/actions/setup-and-greet/action.yml` with:
1. Inputs: `name` and `language` (default: `en`)
2. Steps that:
   - print a greeting in the specified language
   - print the current date and runner OS
   - set an output called `greeted` with value `true`
3. Use the composite action in a workflow with:
   ```yaml
   uses: ./.github/actions/setup-and-greet
   ```

> Verify: Confirm the custom action runs and prints the greeting.

### Notes
- Answer: Created `greet.yml` file whose display name is composite demo on GitHub Actions UI.

---

## Task 6: Reusable Workflow vs Composite Action

| Feature | Reusable Workflow | Composite Action |
|---|---|---|
| Triggered by | `workflow_call` | `uses:` in a step |
| Can contain jobs? | ✅ Yes | ❌ No |
| Can contain multiple steps? | ✅ Yes | ✅ Yes |
| Lives where? | `.github/workflows/<workflow>.yml` | `.github/actions/<action-name>/action.yml` |
| Can accept secrets directly? | ✅ Yes | ❌ No |
| Best for | Reusing an entire CI/CD pipeline with multiple jobs | Reusing a group of steps within a job |

### Rule of Thumb
- **Composite Action = Reusable Steps**
- **Reusable Workflow = Reusable Jobs/Pipeline**

### When to use a Composite Action
- Avoid repeating the same steps in multiple workflows
- Keep logic inside a single job
- Examples: Azure login, Terraform setup, Docker login, greeting/setup scripts

### When to use a Reusable Workflow
- Standardize an entire CI/CD pipeline
- Require multiple jobs, different runners, matrix builds, or deployments
- Examples: Build → Test → Scan → Deploy, org-wide CI/CD templates, multi-stage pipelines
