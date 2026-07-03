### Task 1: Understand `workflow_call`
Before writing any code, research and answer in your notes:
1. What is a **reusable workflow**?

A reusable workflow is a GitHub Actions workflow that can be called by other workflows. It allows you to define common CI/CD logic once and reuse it across multiple repositories or workflows.

Benefits:

Reduces duplication
Easier maintenance
Consistent CI/CD processes
Centralized updates

Example use cases:

Standard build process
Security scanning
Docker image publishing
Deployment workflows

2. What is the `workflow_call` trigger?

workflow_call is a special trigger that allows a workflow to be invoked by another workflow.
Unlike push or pull_request, a workflow with workflow_call does not run automatically from Git events—it runs only when another workflow calls it.

it can accept arguments as well.
on:
  workflow_call:
    inputs:
      environment:
        required: true
        type: string

3. How is calling a reusable workflow different from using a regular action (`uses:`)?
# Reusable Workflow vs Action

| Reusable Workflow                                           | Action                                                        |
| ----------------------------------------------------------- | ------------------------------------------------------------- |
| Contains one or more jobs                                   | Contains steps or logic                                       |
| Called at the job level                                     | Called at the step level                                      |
| Can define runners, permissions, outputs, and multiple jobs | Executes within an existing job                               |
| Stored as a workflow YAML file                              | Stored as an action (JavaScript, Docker, or Composite Action) |

## Example: Reusable Workflow

```yaml
jobs:
  build:
    uses: owner/repo/.github/workflows/build.yml@main
```

## Example: Action

```yaml
steps:
  - uses: actions/checkout@v4
```


4. Where must a reusable workflow file live?
A reusable workflow must be stored in: .github/workflows/
And the workflow must include:
on:
  workflow_call:

---

### Task 2: Create Your First Reusable Workflow
Create `.github/workflows/reusable-build.yml`:
1. Set the trigger to `workflow_call`
2. Add an `inputs:` section with:
   - `app_name` (string, required)
   - `environment` (string, required, default: `staging`)
3. Add a `secrets:` section with:
   - `docker_token` (required)
4. Create a job that:
   - Checks out the code
   - Prints `Building <app_name> for <environment>`
   - Prints `Docker token is set: true` (never print the actual secret)

**Verify:** This file alone won't run — it needs a caller. That's next.

---

### Task 3: Create a Caller Workflow
Create `.github/workflows/call-build.yml`:
1. Trigger on push to `main`
2. Add a job that uses your reusable workflow:
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
3. Push to `main` and watch it run

**Verify:** In the Actions tab, do you see the caller triggering the reusable workflow? Click into the job — can you see the inputs printed?

---

### Task 4: Add Outputs to the Reusable Workflow
Extend `reusable-build.yml`:
1. Add an `outputs:` section that exposes a `build_version` value
2. Inside the job, generate a version string (e.g., `v1.0-<short-sha>`) and set it as output
3. In your caller workflow, add a second job that:
   - Depends on the build job (`needs:`)
   - Reads and prints the `build_version` output

**Verify:** Does the second job print the version from the reusable workflow?

Answer: Created reusable-build.yml and call-build.yml file (Great Example to look for revision).

---

### Task 5: Create a Composite Action
Create a **custom composite action** in your repo at `.github/actions/setup-and-greet/action.yml`:
1. Define inputs: `name` and `language` (default: `en`)
2. Add steps that:
   - Print a greeting in the specified language
   - Print the current date and runner OS
   - Set an output called `greeted` with value `true`
3. Use the composite action in a new workflow with `uses: ./.github/actions/setup-and-greet`

**Verify:** Does your custom action run and print the greeting?

Answer:
Created greet.yml file whose display name is composite demo on github actions UI.


---

### Task 6: Reusable Workflow vs Composite Action
Fill this in your notes:

| | Reusable Workflow | Composite Action |
|---|---|---|
| Triggered by | `workflow_call` | `uses:` in a step |
| Can contain jobs? | ? | ? |
| Can contain multiple steps? | ? | ? |
| Lives where? | ? | ? |
| Can accept secrets directly? | ? | ? |
| Best for | ? | ? |


Answer:

# Reusable Workflow vs Composite Action

| Feature | Reusable Workflow | Composite Action |
|---|---|---|
| **Triggered by** | `workflow_call` | `uses:` in a workflow step |
| **Can contain jobs?** | ✅ Yes (one or more jobs) | ❌ No (only steps) |
| **Can contain multiple steps?** | ✅ Yes | ✅ Yes |
| **Lives where?** | `.github/workflows/<workflow>.yml` | `.github/actions/<action-name>/action.yml` |
| **Can accept secrets directly?** | ✅ Yes (via `secrets:` in `workflow_call`) | ❌ No (must be passed as inputs or inherited from the calling workflow) |
| **Best for** | Reusing an entire CI/CD pipeline with multiple jobs, runners, environments, and deployments | Reusing a group of common steps within a job (e.g., setup, login, build, greeting) |

## Rule of Thumb

- **Composite Action = Reusable Steps**
- **Reusable Workflow = Reusable Jobs/Pipeline**

### Use a Composite Action when:
- You want to avoid repeating the same steps in multiple workflows.
- The logic runs within a single job.
- Examples:
  - Azure login
  - Terraform setup
  - Docker login
  - Greeting/setup scripts

### Use a Reusable Workflow when:
- You want to standardize an entire CI/CD pipeline.
- You need multiple jobs, different runners, matrix builds, or deployment environments.
- Examples:
  - Build → Test → Scan → Deploy
  - Organization-wide CI/CD templates
  - Multi-stage deployment pipelines