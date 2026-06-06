
## Day 42 — GitHub Hosted & Self‑Hosted Runners

This note collects hands-on tasks and answers for learning about GitHub-hosted and self-hosted runners.

---

### Task 1 — GitHub-hosted runners

Steps:

- Create a workflow with three jobs that run in parallel on different OS images: `ubuntu-latest`, `windows-latest`, and `macos-latest`.
- In each job print the OS name, the runner hostname, and the current user.

Answer:

- Example workflow created at `.github/workflows/github_runner.yml` (exercise file).
- GitHub-hosted runners are VMs managed by GitHub where your jobs execute; GitHub maintains the OS, updates, and the host environment.

Example job snippet:

```yaml
jobs:
  ubuntu_job:
    runs-on: ubuntu-latest
    steps:
      - run: uname -a
      - run: hostname
      - run: whoami
```

---

### Task 2 — Explore what's pre-installed

Steps:

- On `ubuntu-latest` add steps that print `docker --version`, `python --version`, `node --version`, and `git --version`.
- Consult the official GitHub docs for the full software list for `ubuntu-latest`.

Answer:

- Updated the example workflow to print versions (see `.github/workflows/github_runner.yml`).
- Official list: https://docs.github.com/actions/using-github-hosted-runners/about-github-hosted-runners#supported-software

---

### Task 3 — Set up a self-hosted runner

Steps:

1. In your GitHub repo, go to Settings → Actions → Runners → New self-hosted runner.
2. Choose the OS (e.g., Linux) and follow the provided registration and install commands on your VM.
3. Start the runner and verify it shows as *Idle* and online in the GitHub UI.

Answer / Notes:

- I registered a self-hosted runner on an AWS VM and confirmed it is connected in the repo UI.
- The runner logs and status are visible under the repository's Actions → Runners page.

---

### Task 4 — Use your self-hosted runner

Steps:

1. Create `.github/workflows/self-hosted.yml` and set `runs-on: self-hosted`.
2. Add steps to print `hostname` and the working directory, then create a file on the runner and verify it exists after the run.

Answer:

- Example workflow executed on the self-hosted VM; a file was created under `/home/ubuntu` as part of the job run.

---

### Task 5 — Labels

Steps:

1. Add a label to the runner (for example `my-linux-runner` or `Devendra`).
2. Update your workflow to use `runs-on: [self-hosted, my-linux-runner]` so only runners with that label pick up the job.

Answer:

- I added label `Devendra` to the runner and verified the job was picked up by the labeled runner.

Why labels are useful:

- Labels let you target specific runners (for example: `gpu`, `windows`, `aws-az1`) when you have multiple self-hosted hosts. This helps route jobs to machines with the right capabilities.

---

### Task 6 — GitHub-hosted vs Self-hosted (comparison)

| Topic | GitHub-hosted runner | Self-hosted runner |
|---|---|---|
| Who manages it? | GitHub manages the VM, OS, updates, and maintenance. | You manage the machine, OS, updates, and maintenance. |
| Cost | Uses GitHub Actions minutes and billing for hosted runners. | You pay for the machine/VM, storage, networking, and maintenance. |
| Pre-installed tools | Many tools pre-installed (Git, Docker, Python, Node, .NET, Azure CLI, etc.). | Only the tools you install and maintain. |
| Good for | Standard CI/CD pipelines, quick setup, reproducible hosted environments. | Access to private networks, custom software, GPUs, or specific hardware. |
| Security concern | Code runs on GitHub-managed infrastructure; secrets must be handled carefully. | You are responsible for securing the runner and protecting secrets. |

---

### Useful links

- GitHub-hosted runners: https://docs.github.com/actions/using-github-hosted-runners
- Self-hosted runners: https://docs.github.com/actions/hosting-your-own-runners

---

### Notes

Images / evidence from the original notes can remain in the folder and be embedded as needed.

File updated: `d:\DevOpsTrain\90DaysOfDevOps\2026\day-42-Runners-Github&Self-Hosted\day-42-runners.md`