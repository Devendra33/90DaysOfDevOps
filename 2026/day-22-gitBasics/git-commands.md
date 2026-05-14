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

**`git log --graph`**
Displays the history of all commit logs. with lines look slighty better but not that useful.        

**`git diff HEAD`**
Compare working directory with (Head) last commit

**`git diff --staged`**
Compare staged changes with with (Head) last commit

**`git blame <file>`**
shows who modified the file line by line.

**`git show <commit-id>`**
shows details about the commit. what was modified and by whom.

---

## Branches

### Viewing & Creating Branches

**`git branch`**
Shows all branches present in the repository. The current branch is marked with `*`.

**`git branch <branchname>`**
Creates a new branch. The branch logs will reference the current branch.

**`git branch -D <branchname>`**
Deletes a branch. you should be not be switched in to the branch that you are deleting

### Switching/Merge Branches

**`git checkout <branchname>`**
Switches to a different branch.

**`git checkout -b <branchname>`**
Creates a new branch and immediately switches to it.

**`git merge <branchname>`**
if we are present inside main branch and then runs 'git merge dev', then dev branch will be merged with main branch.

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

---

## Undo Changes

**`git reset <commit-id>`**
Reset the Current branch to specified commit and discards all the changes to local.

**`git restore <file>`**
Restores the file to from the last commit. has three imp flags --hard/ --soft/ --mixed.

**`git commit --amend -m "new message"`**
Change the message of last commit. (imp DO NOT CHANGE IF THE LAST COMMIT IS PRESENT ON REMOTE BRANCH - to avoid issues). only use message is wrong in local branch.

---

## Stashing

**`git stash`**
Hides the current directory work of a branch. and we can switch to another branch to work on without adding or commiting the changes.

**`git stash list`**
list all the stashs.

**`git stash pop`**
Restores the hidden work of the branch.

**`git stash clear`**
delete the stash entry.

---

## Rebase and Cherry Pick

**`git rebase origin/main`**
If local and remote branches becomes divergent branchs then use above. it make all the commit in one clean readable history line (works on same branch)

**`git pull origin main --rebase`**
If local and remote branches becomes divergent branchs then use above. it make all the commit in one clean readable history line (work on different branch - example I created a feature branch from main and now I want to changes of orgin main in my feature branch)

**`git cherry-pick <commit id>`**
We can take specfic commit from another branch.