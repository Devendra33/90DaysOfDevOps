## Day 43 — Jobs, Steps, Environments & Conditionals

This note contains exercises and concise answers for building multi-job workflows, using environment variables, passing outputs between jobs, and applying conditionals.

---

### Task 1 — Multi-job workflow

Goal: Create `.github/workflows/multi-job.yml` with three jobs: `build`, `test`, and `deploy`. Make `test` depend on `build`, and `deploy` depend on `test`.

Example (job dependency using `needs`):

```yaml
jobs:
	build:
		runs-on: ubuntu-latest
		steps:
			- run: echo "Building the app"

	test:
		needs: build
		runs-on: ubuntu-latest
		steps:
			- run: echo "Running tests"

	deploy:
		needs: test
		runs-on: ubuntu-latest
		steps:
			- run: echo "Deploying"
```

Verify: The Actions graph shows `build -> test -> deploy` when opened in the repo UI.

---

### Task 2 — Environment variables (three levels)

Goal: Demonstrate workflow, job, and step level environment variables and print GitHub context values.

Example:

```yaml
env:
	APP_NAME: myapp            # workflow level

jobs:
	example:
		runs-on: ubuntu-latest
		env:
			ENVIRONMENT: staging   # job level
		steps:
			- name: Print all
				env:
					VERSION: 1.0.0     # step level
				run: |
					echo "APP_NAME=$APP_NAME"
					echo "ENVIRONMENT=$ENVIRONMENT"
					echo "VERSION=$VERSION"
					echo "Commit: $GITHUB_SHA"
					echo "Actor: $GITHUB_ACTOR"
```

Note: `GITHUB_SHA` and `GITHUB_ACTOR` are provided by the GitHub context.

---

### Task 3 — Job outputs

Goal: Have one job emit an output (e.g., today's date) and another job read it.

Example:

```yaml
jobs:
	produce:
		runs-on: ubuntu-latest
		outputs:
			today: ${{ steps.set.outputs.today }}
		steps:
			- id: set
				run: echo "::set-output name=today::$(date +%F)"

	consume:
		needs: produce
		runs-on: ubuntu-latest
		steps:
			- run: echo "Produced date is: ${{ needs.produce.outputs.today }}"
```

Why pass outputs: to transfer computed values (build IDs, artifact names, timestamps, status flags) between otherwise isolated jobs.

---

### Task 4 — Conditionals

Examples:

- Step that runs only on `main`:

```yaml
- name: Run on main only
	if: github.ref == 'refs/heads/main'
	run: echo "Main branch"
```

- Step that runs only when previous step failed:

```yaml
- name: Run on failure
	if: failure()
	run: echo "Previous step failed"
```

- Job that runs only on push events (not PRs):

```yaml
on: [push, pull_request]

jobs:
	only-on-push:
		if: github.event_name == 'push'
		runs-on: ubuntu-latest
		steps:
			- run: echo "This runs on push only"
```

- `continue-on-error: true` allows a step to fail without failing the job — useful for non-critical checks where you still want later steps to run.

---

### Task 5 — Putting it together (smart pipeline)

Goal: Create `.github/workflows/smart-pipeline.yml` that triggers on push, runs `lint` and `test` in parallel, then `summary` after both complete. `summary` prints whether the push is `main` or a feature branch and prints the commit message.

Example:

```yaml
on: push

jobs:
	lint:
		runs-on: ubuntu-latest
		steps:
			- run: echo "linting..."

	test:
		runs-on: ubuntu-latest
		steps:
			- run: echo "testing..."

	summary:
		needs: [lint, test]
		runs-on: ubuntu-latest
		steps:
			- run: |
					if [ "${{ github.ref }}" = 'refs/heads/main' ]; then echo "Main branch push"; else echo "Feature branch push"; fi
					echo "Commit message: ${{ github.event.head_commit.message }}"
```

---

File updated: 
https://github.com/Devendra33/Github-Actions/tree/main/.github/workflows