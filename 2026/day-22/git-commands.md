# Git Commands Reference

A comprehensive guide to essential Git commands for daily development work.

## Daily Commands

### Staging & Committing

**`git add <filename>`** or **`git add .`**
Moves files to the staging area. The `.` moves all untracked files to the staging area.

**`git restore --staged <filename>`** or **`git restore --staged .`**
Moves files from the staging area back to untracked files.

**`git commit -m "<message>"`**
Creates a commit with your staged changes.

### Syncing with Remote

**`git pull origin main`** or **`git pull`**
Pulls remote branch changes to your local repository. Makes changes if any are present in the remote.

*Note: `git pull` is a combination of `git fetch` + `git merge`*

**`git fetch`**
Fetches details of branches and tags from the remote repository without making actual changes to your local repository.

**`git push origin main`** or **`git push`**
Pushes your local changes to the remote branch after committing.

### Viewing History

**`git log`**
Displays the history of all commit logs.

*Best practice: `git log --oneline`* - Shows commits in a condensed format.

---

## Branches

### Viewing & Creating Branches

**`git branch`**
Shows all branches present in the repository. The current branch is marked with `*`.

**`git branch <branchname>`**
Creates a new branch. The branch logs will reference the current branch.

**`git branch -D <branchname>`**
Deletes a branch.

### Switching Branches

**`git checkout <branchname>`**
Switches to a different branch.

**`git checkout -b <branchname>`**
Creates a new branch and immediately switches to it.

---

## Cloning & Remoting

### Cloning

**`git clone <url>`**
Clones a repository from remote to local using HTTPS or SSH URLs.

### Managing Remote URLs

**`git remote -v`**
Displays the upstream/remote URL configured for the repository.

**`git remote add origin <url>`**
Sets the upstream/remote URL. Adds a new remote named `origin`.

*Note: The upstream URL is stored in the variable called `origin`.*

*Used when:*
- *You initialize a new local repository*
- *Connecting to GitHub/Azure DevOps/GitLab for the first time*

**`git remote set-url origin <url>`**
Changes the URL of an existing remote.

*Note: The upstream URL is stored in the variable called `origin`.*

*Used when:*
- *Repository moved*
- *Switching from HTTPS to SSH*
- *Changing GitHub account/organization/repository*
- *Fixing a wrong remote URL*

---

## Setting Identity & Verification

**`git config --global user.name "<name>"`**
Sets the global username for Git commits.

**`git config --global user.email "<email>"`**
Sets the global email for Git commits.

**`git config --list`**
Displays all currently configured Git credentials.







