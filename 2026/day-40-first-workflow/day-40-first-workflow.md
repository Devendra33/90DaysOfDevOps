# Day 40 — First GitHub Actions Workflows

This day's work was completed in a separate GitHub repository.

- Repository: https://github.com/Devendra33/Github-Actions
- Files to review:
	- `.github/workflows/CICD.yaml`
	- `.github/workflows/hello.yml`

---

## Task 1 — Setup (Done)

Repository is created and CI workflows are added. See the `CICD.yaml` workflow in the repo for the full pipeline configuration.

Reference: https://github.com/Devendra33/Github-Actions

---

## Task 2 — Hello Workflow

Create a simple workflow at `.github/workflows/hello.yml` that demonstrates GitHub Actions basics (trigger, runner, steps). Typical content includes:

```yaml
name: Hello
on: [push]
jobs:
	say-hello:
		runs-on: ubuntu-latest
		steps:
			- name: Checkout
				uses: actions/checkout@v4
			- name: Say hello
				run: echo "Hello from GitHub Actions"
```

See `.github/workflows/hello.yml` in the repo for the actual file used.

---

## Task 3 — Understand the Workflow Anatomy

Below are the common top-level keys in a GitHub Actions workflow file and what each does.

- `on:` — Trigger condition(s) for the workflow (e.g., `push`, `pull_request`, `workflow_dispatch`, `schedule`). Determines when the workflow runs.

- `jobs:` — A mapping of jobs the workflow executes. Each job is a set of steps and runs independently unless dependencies are defined.

- `runs-on:` — Specifies the runner environment (machine image) to execute the job on (e.g., `ubuntu-latest`, `windows-latest`, or self-hosted runners).

- `steps:` — Ordered list of actions or commands executed in the job. Steps run sequentially within a job.

- `uses:` — Runs a pre-built action from the marketplace or repository (e.g., `actions/checkout@v4`). Use it to reuse common tasks.

- `run:` — Executes a shell command directly on the runner (e.g., `run: dotnet test`).

- `name:` — Human-readable label for a job or step. Helps identify what the job/step does in the UI.

---

If you want, I can add a short example `CICD.yaml` summarizing build/test/deploy stages from your repo, or format the two workflow files into a README excerpt.
