# Day 24 Notes - Advanced Git: Merge, Rebase, Squash, Stash, Cherry-Pick

## Task 1: Git Merge — Hands-On

1. Create a new branch `feature-login` from `main`, and add a couple of commits.
2. Switch back to `main` and merge `feature-login` into `main`.
3. Observe the merge — did Git do a **fast-forward** merge or a **merge commit**?

- Observed: Fast-forward merge.

![Merge feature-login](image.png)

4. Now create another branch `feature-signup`, add commits to it, and also add a commit to `main` before merging.
5. Merge `feature-signup` into `main` — what happens this time?

- Answer: I created `feature-signup`, made commits there, and also made commits on `main`. This caused a non-fast-forward merge.

![Feature signup branch](image-1.png)

![Merge result](image-2.png)

### Notes

- **What is a fast-forward merge?**
  - A fast-forward merge happens when the branch being merged is directly ahead of the current branch. No merge commit is created.

- **When does Git create a merge commit instead?**
  - Git creates a merge commit when the branches have diverged and there is history on both sides.

- **What is a merge conflict?**
  - A merge conflict occurs when two branches modify the same file at the same line or conflicting areas.

## Task 2: Git Rebase — Hands-On

1. Create a branch `feature-dashboard` from `main` and add 2–3 commits.
2. While on `main`, add a new commit so `main` moves ahead.

![Main moved ahead](image-3.png)

3. Switch to `feature-dashboard` and rebase it onto `main`.

![Rebase feature-dashboard](image-4.png)

4. Observe your history with `git log --oneline --graph --all` — how does the history look compared to a merge?

![Rebase history](image-5.png)

### Notes

- **What does rebase actually do to your commits?**
  - Rebase rewrites commits from one branch onto another branch, creating a linear history.

- **How is the history different from a merge?**
  - Rebase produces a straight, linear commit history without a merge commit, while merge preserves branch topology.

- **Why should you never rebase commits that have been pushed and shared with others?**
  - Rebasing shared commits rewrites history, which can confuse collaborators and make it hard to reconcile branches.

- **When would you use rebase vs merge?**
  - Use **rebase** to keep history linear and apply new changes cleanly from an updated base branch.
  - Use **merge** to preserve complete branch history and combine feature work when branch topology matters.

## Task 3: Squash Commit vs Merge Commit

1. Create a branch `feature-profile` and add 4–5 small commits (typo fix, formatting, etc.).
2. Merge it into `main` using `--squash` — what happens?
3. Check `git log` — how many commits were added to `main`?

![Squash merge history](image-6.png)

![Squash merge result](image-7.png)

4. Now create another branch `feature-settings`, add a few commits.
5. Merge it into `main` **without** `--squash` (regular merge) — compare the history.

- Answer: Regular merge adds all commits from the feature branch as-is, preserving individual commits.

### Notes

- **What does squash merging do?**
  - Squash merge combines multiple commits into a single commit when merging.

- **When would you use squash merge vs regular merge?**
  - Use **regular merge** when you want the full commit history.
  - Use **squash merge** when you want a cleaner history and only a single commit on the target branch.

- **What is the trade-off of squashing?**
  - You get a cleaner history, but you lose detailed individual commit history.

## Task 4: Git Stash — Hands-On

Refer to: `D:\DevOpsTrain\90DaysOfDevOps\2026\day-22-gitBasics\git-commands.md` (Stashing section).

### Common stash commands

- **`git stash`**
  - Saves the current working directory changes and allows you to switch branches without committing.

- **`git stash list`**
  - Lists all stash entries.

- **`git stash pop`**
  - Restores the most recent stash and removes it from the stash stack.

- **`git stash apply`**
  - Restores a stash without removing it from the stash stack.

- **`git stash drop`**
  - Deletes a specific stash entry.

- **`git stash clear`**
  - Deletes all stash entries.

## Task 5: Cherry Picking

1. Create a branch `feature-hotfix` and make 3 commits with different changes.
2. Switch to `main`.
3. Cherry-pick **only the second commit** from `feature-hotfix` onto `main`.
4. Verify with `git log` that only that one commit was applied.

![Cherry pick result](image-8.png)

### Notes

- **What does cherry-pick do?**
  - `git cherry-pick` copies a specific commit from one branch and applies it onto another branch.

- **When would you use cherry-pick in a real project?**
  - Use cherry-pick when you need a specific change from another branch without merging the entire branch.

- **What can go wrong with cherry-picking?**
  - If the target branch already changed the same lines, conflicts may occur during cherry-pick.