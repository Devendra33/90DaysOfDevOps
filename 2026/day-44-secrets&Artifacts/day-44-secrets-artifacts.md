# Day 44 — Secrets & Artifacts

Practical exercises for securely using secrets in GitHub Actions, uploading/downloading artifacts, running tests, and caching dependencies.

---

## Task 1 — GitHub Secrets

Steps

1. Go to your repo → Settings → Secrets and Variables → Actions and add a secret named `MY_SECRET_MESSAGE`.
2. Create a workflow that uses the secret without printing its value.
3. Try printing `${{ secrets.MY_SECRET_MESSAGE }}` directly and observe GitHub masks the value in logs.

Key point: Never print secrets in CI logs. Even masked values can leak in screenshots or if logs are downloaded; treat secrets like credentials.

Example snippet (do NOT echo the secret itself):

```yaml
jobs:
   check-secret:
      runs-on: ubuntu-latest
      steps:
         - name: Check secret is set
            env:
               MY_SECRET: ${{ secrets.MY_SECRET_MESSAGE }}
            run: |
               if [ -n "$MY_SECRET" ]; then
                  echo "The secret is set: true"
               else
                  echo "The secret is set: false"
               fi
```

---

## Task 2 — Use secrets as environment variables

Steps

1. Pass a secret to a step as an environment variable.
2. Use it in a shell command — do not hardcode or print it.
3. Add secrets `DOCKER_USERNAME` and `DOCKER_TOKEN` to be used later for pushes.

Example:

```yaml
jobs:
   docker-login:
      runs-on: ubuntu-latest
      steps:
         - uses: actions/checkout@v4
         - name: Login to registry
            env:
               DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
               DOCKER_TOKEN: ${{ secrets.DOCKER_TOKEN }}
            run: |
               echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin
```

Note: Use secret scanning and expiration policies where available. Avoid storing long-lived secrets when possible.

---

## Task 3 — Upload artifacts

Steps

1. Generate a file (test report, log, coverage report) in a step.
2. Upload it with `actions/upload-artifact`.
3. After the run you can download artifacts from the Actions UI.

Example:

```yaml
steps:
   - run: echo "test report" > report.txt
   - uses: actions/upload-artifact@v4
      with:
         name: test-report
         path: report.txt
```

---

## Task 4 — Download artifacts between jobs

Steps

1. Job A: produce a file and upload it as an artifact.
2. Job B: use `needs: jobA`, download the artifact with `actions/download-artifact`, and consume it.

Example:

```yaml
jobs:
   produce:
      runs-on: ubuntu-latest
      steps:
         - run: echo "hello from produce" > out.txt
         - uses: actions/upload-artifact@v4
            with:
               name: out-artifact
               path: out.txt

   consume:
      needs: produce
      runs-on: ubuntu-latest
      steps:
         - uses: actions/download-artifact@v4
            with:
               name: out-artifact
               path: ./downloaded
         - run: cat downloaded/out.txt
```

When to use artifacts: transfer build outputs, test reports, binaries, or logs between jobs or to persist results for later inspection.

---

## Task 5 — Run real tests in CI

Steps

1. Add your test script to the repo.
2. Create a workflow that checks out the code, installs dependencies, runs the script, and fails if it returns non-zero.
3. Break the script to confirm the pipeline fails, then fix it to confirm it passes.

Example (Python):

```yaml
jobs:
   test:
      runs-on: ubuntu-latest
      steps:
         - uses: actions/checkout@v4
         - name: Set up Python
            uses: actions/setup-python@v4
            with:
               python-version: '3.11'
         - name: Install deps
            run: pip install -r requirements.txt
         - name: Run tests
            run: pytest -q
```

---

## Task 6 — Caching

Steps

1. Add `actions/cache` to cache dependencies (npm, pip, Maven, NuGet, etc.).
2. Run the workflow twice and observe speedup on the second run.

Example (pip cache):

```yaml
steps:
   - uses: actions/checkout@v4
   - name: Cache pip
      uses: actions/cache@v4
      with:
         path: ~/.cache/pip
         key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.txt') }}
   - name: Install deps
      run: pip install -r requirements.txt
```

What is cached and where: Package files and dependency artifacts are cached on GitHub's cache storage (based on your repo and key). The cache stores compressed archives referenced by the key and is restored to the runner's filesystem when the key matches.

---

### Notes

- Avoid printing secrets or writing them to logs or artifacts. Use scoped secrets and rotation policies.
- Artifacts are visible to anyone with access to the Actions run — treat them as sensitive if they contain secrets or PII.

File updated: `d:\DevOpsTrain\90DaysOfDevOps\2026\day-44-secrets&Artifacts\day-44-secrets-artifacts.md`

