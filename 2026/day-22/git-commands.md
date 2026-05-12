Handy GIT Commands

### Daily Commands

git add <filename>/ git add . - To move file in staging area. (.) is used to move all untracked files to staging area.
git restore --staged <filename>/ git restore --staged . - To move files from staging area to untracked files.
git commit -m "" - To commit the changes.
git pull origin main - pull the remotes branch changes to local repo. Makes changes if any changes are present in the remote
    short - git pull
    Note: it is combination of git fetch + git merge

git fetch - it fetchs details of the branches/ tags present on the repo but did not make any actual change to the local repo.
 
git push origin main - it used to push the local changes to remote branch after commiting.
    short - git push

git log - used to check the history of commits logs
    best practice - git log --oneline

### Branches

git branch - show all the branchs present for the repo (*) will be represent current working branch.
git branch <branchname> - Creates a new branch, logs will be reference from current present branch.
git brach -D <branchname> - used to delete a branch
git checkout <branchname> - use to switch to other branch
git checkout -b <branchname> - use to create a new branch and immediately swtich to new branch that is just created.


### Cloning and Remoting

git clone <url> - used to clone a branch from remote to local using Https/ ssh urls.
git remote -v - used to see the upstream/ remote url configured
git remote add origin <url> -  to set the upstream/ remote url. (Adds a new remote named origin)
    Note: upstream url is stored in the variable called origin. 
    Used when:
        you initialize a new local repo
        first time connecting to GitHub/Azure DevOps/GitLab

git remote set-url origin <url> - replaces old URL with new one (Changes the URL of an existing remote)
    Note: upstream url is stored in the variable called origin.
    Used when:
        repository moved
        switching from HTTPS to SSH
        changing GitHub account/org/repo
        fixing wrong remote URL

### Setting Identity/ Verification

 git config --global user.name "dev" - use to set the username
 git config --global user.email "dev@gmail.com" - use to set the email id
 git config --list - to see what credentials are currentlt configured.







