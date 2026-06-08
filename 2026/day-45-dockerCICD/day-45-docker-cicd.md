# Day 45 — Docker CI/CD

## Overview
This day covers building a Docker image in CI, pushing to Docker Hub, and running the image locally. Follow the tasks below and record the verification steps and answers.

---

## Task 1 — Prepare
- Use the app you Dockerized on Day 36 (or any simple Dockerfile)
- Add the Dockerfile to your `github-actions-practice` repo (or create a minimal one)
- Make sure `DOCKER_USERNAME` and `DOCKER_TOKEN` secrets are set (from Day 44)

Answers
- Added a `Dockerfile` and `index.html`.

---

## Task 2 — Build the Docker image in CI
Create `.github/workflows/docker-publish.yml` that:
- Triggers on push to `main`
- Checks out the code
- Builds the Docker image and tags it

Verify
- Check the build step logs — does the image build successfully?

Answers
- Created `docker-publish.yml` and added a build step that tags the image with the GitHub commit ID.

---

## Task 3 — Push to Docker Hub
Add steps to:
- Log in to Docker Hub using your secrets (`DOCKER_USERNAME`, `DOCKER_TOKEN`)
- Tag the image as `username/repo:latest` and `username/repo:sha-<short-commit-hash>`
- Push both tags

Verify
- Go to Docker Hub — confirm both tags exist for the repository.

Answers
- Added Docker Hub login steps and tag/push commands in the workflow.

---

## Task 4 — Only push on main
- Add a condition so push steps only run on the `main` branch (not on feature branches or PRs).

Test
- Push to a feature branch and verify the image is built but NOT pushed to Docker Hub.

Answers
- Added `if: github.ref == 'refs/heads/main'` (or equivalent) to the login/push steps.

---

## Task 5 — Add a status badge
1. From the Actions tab, open the `docker-publish` workflow
2. Use the three-dot menu to create a status badge and copy the URL
3. Add the badge to your `README.md` and push

Answers
- Created the status badge and added it to `README.md`.

---

## Task 6 — Pull and run it
1. On your local machine or cloud server, pull the image you pushed
2. Run it
3. Confirm it works

Answers
- Tested on Docker Desktop.

Example pull & run commands
```powershell
docker pull username/repo:latest
docker run -d -p 8080:80 username/repo:latest
```

---

## Notes — Full journey from `git push` to a running container
1. `git push` to `main` triggers the GitHub Actions workflow defined in `.github/workflows/docker-publish.yml`.
2. The workflow runs jobs that check out the repository and build the Docker image.
3. The image is tagged (e.g. `latest` and `sha-<short>`).
4. If on `main`, the workflow logs into Docker Hub using secrets and pushes the tags.
5. The pushed image appears in Docker Hub and is available to pull.
6. On a host (local or cloud), run `docker pull username/repo:tag` and then `docker run` to start the container and serve the app.

Optional: include the workflow status badge in `README.md` to show build status.

---

Write in your notes: What is the full journey from `git push` to a running container?
