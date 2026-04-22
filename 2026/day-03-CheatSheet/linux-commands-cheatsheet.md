## Top Commands That We Use in Linux Day to Day

### Daily usage
- **man**: Help system for each command
- **hostname**: Show the server name
- **whoami**: Show the current user
- **which**: Show the path of the command being used
- **shutdown**: Turn off the server
- **reboot**: Restart the server

### File System
- **ls**: List files and folders in the current working directory (`pwd`)
  - pro tip: use `ls -al` for a detailed view
- **cd**: Change directories
- **mkdir**: Create a directory
  - pro tips:
    1. Use `mkdir -p "<path>/<newFolderName>"` to create nested directories
    2. Use `mkdir file-{1..5}` to create multiple folders at once
    3. Use `rm -rf file-{1..5}` to remove them
- **touch**: Create a new empty file
  - pro tip: You can use the same brace expansion style with `touch`
- **cat**: Display file contents
  - pro tip: use `cat -b <filename>` to show line numbers
- **pwd**: Show the current working directory
- **vim / nano**: Edit files
  - pro tip: `vim` is more common in industry
- **rm**: Remove files or folders
  - pro tip: `rm -rf` removes folders recursively
- **cp**: Copy files or folders
  - syntax: `cp <source> <destination>`
- **mv**: Move or rename files or folders
  - syntax: `mv <source> <destination>`
- **sudo**: Run a command with superuser privileges
- **head / tail**: View the top or bottom of a file
  - use `-n` to display a specific number of lines
  - pro tip: `tail -f` follows new appended logs
- **>** and **>>**: Redirect output to a file
  - `>` overwrites the file
  - `>>` appends to the file
  - pro tip: `cmd > /dev/null` suppresses the output
- **sort**: Sort file contents alphabetically
  - example: `sort test.txt`
- **wc**: Word count
  - flags: `-l` count lines, `-w` count words

### File Permission Management
- Remember `ugo`:
  - `u` = user
  - `g` = group
  - `o` = others
- Remember `rwx`:
  - `r` = read
  - `w` = write
  - `x` = execute
- `+` adds permissions
- `-` removes permissions

- **chmod**: Change file permissions
  - example: `chmod u+rwx <filename>`
  - example: `chmod g-rx <filename>`
- **chown**: Change the owner of a file or folder
  - example: `chown <username> <file-or-folder>`
- **chgrp**: Change the group owner for a file or folder
  - example: `chgrp <groupname> <file-or-folder>`
- **newgrp**: Refresh group membership in the current shell

### User / Group Management
- **useradd**: Add a new user
  - use `-m` to create the home directory
  - use `-s /usr/bin/bash` to set the login shell
- **usermod**: Modify an existing user
  - example: `usermod -l aman devendra`
- **passwd**: Set or change a user password
  - check `/etc/passwd`
  - check encrypted passwords in `/etc/shadow`
- **su**: Switch to another user
  - example: `su username`
- **exit**: Logout from a switched user session
- **userdel**: Delete a user
- **groupadd**: Add a new group
- **gpasswd**: Manage group membership
  - example: `gpasswd -a username groupname`
  - example: `gpasswd -d username groupname`
  - pro tip: `cat /etc/group` to view groups
  - pro tip: `cat /etc/gshadow` to view encrypted group data

### Find and Search
- **grep**: Global Regular Expression Print
  - pro tip: use `-i` for case-insensitive search
  - examples:
    - `grep -i devendra /etc/passwd`
    - `grep -i devendra /etc/passwd /etc/gpasswd`
    - `grep -r devendra /`
    - `grep '^devendra' /etc/passwd`
    - `grep 'devendra$' /etc/passwd`
    - `grep -i devendra /etc/passwd > name.txt`
    - `cat filename | grep "searchString"`
- **find**: Search for files based on conditions such as name, permissions, user, group, size
  - examples:
    - `find /home -name shub.txt`
    - `find / -perm 2644`
    - `find / -user devendra`
    - `find / -group ubuntu`
    - `find /tmp -size -10M`
    - `find /tmp -size +10M`

### Process and Service Management
- Install a package on Ubuntu/Debian:
  - `sudo apt-get update`
  - `sudo apt-get install docker.io`

- Un-install/Remove a package on Ubuntu/Debian:
  - `sudo apt-get remove`

- On Red Hat-based systems use `rpm` / `dnf`
- On CentOS use `yum`
- Check the Linux distribution:
  - `cat /etc/os-release`

- Systemd service commands:
  - `systemctl status nginx`
  - `systemctl stop nginx`
  - `systemctl start nginx`
- View service logs:
  - `journalctl -u nginx`

### Memory and Volume Management
- **top**: Show the top processes
- **htop**: Interactive process viewer with scrolling
- **kill**: Terminate a process
  - example: `kill <PID>`
  - force kill: `kill -9 <PID>`

- **free -h**: Show memory usage
- **df -h**: Show disk usage in human-readable format
- **lsblk**: List all the storage block present/ Attached to VM.

### Networking
- **ssh**: Connect to a remote host
  - example: `ssh -i <privatekey> user@publicdomain`
  - note: remote public keys are stored in `~/.ssh/authorized_keys`
- **ifconfig**: Show network interfaces and IP addresses
- **netstat -tuln**: Show listening services and ports
- **nmcli**: NetworkManager CLI
  - example: `nmcli con show`

### Automation
- **cron**: Schedule recurring tasks with cron jobs
- **env**: Show environment variables
  - note: exported variables disappear when the shell exits unless saved in `~/.bashrc`