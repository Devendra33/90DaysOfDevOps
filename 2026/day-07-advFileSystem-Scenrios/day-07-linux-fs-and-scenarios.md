## Core Directories (Must Know)
- **/** (root) - The starting point of everything
- **/home** - User home directories
- **/root** - Root user's home directory
- **/etc** - Configuration files
- **/var/log** - Log files (very important for DevOps!)
- **/tmp** - Temporary files

## Additional Directories (Good to Know)
- **/bin** - Essential command binaries
- **/usr/bin** - User command binaries
- **/opt** - Optional/third-party applications, contains the source code

## Finding the Largest Log File in /var/log
- **ls -lSh** (l - long listing, capital S - for sorting file size, h for converting kb to MB/GB)
- **sudo du -ah / | sort -rh | head -n 10** (Gives top 10 files/folders by biggest file size on the VM)
  - Note: **du** works on both files and folders, while **find** works on only files (no folders)
  - Note: **du -ah** | **sort -r** (reverse order - sorts descending order, -h means human readable form)
- **rm file.txt** (use -r flag for removing directories)

## Working with Services

### Scenario 1: Service Not Starting (Before/After Reboot)
**Hint:**
- First check: Is the service running or failed?
- Then check: What do the logs say?
- Finally check: Is it enabled to start on boot?

- **systemctl status nginx** (shows the status of the service - active, stopped, etc.)
- **systemctl start nginx** (Start the service, does not guarantee service keeps running after reboot)
- **systemctl stop nginx** (Stop the service)
- **systemctl is-enabled nginx** (shows if the service is enabled or not, can also be seen in status in the value of Loaded)
- **systemctl list-units --type=service** (shows all the services on the system)

**Note:**
- status=static (it depends on the service to start)
- status=masked (we can never enable it to auto start on reboot, until we unmask it)
  - Even if the service is masked, it can still be active but after reboot it will not automatically start.
  - To unmask it: **sudo systemctl unmask nginx**

### Scenario 2: High CPU Usage (Application Server is Slow)
- **ps aux --sort=-%cpu | head -n 10** (Gives top 10 processes using most CPU)
- **ps aux --sort=-%mem | head -n 10** (Gives top 10 processes using most memory)
- **htop** - We can see processes using this command also, but it does not work with grep

If some unnecessary process is using high memory/CPU, then kill the process:
- **kill -9 PID**

### Scenario 3: Finding Service Logs (Investigating Service Issues)
First, check if the service is available:
- **systemctl status nginx**

- **journalctl -u nginx** (To see the logs)
- **journalctl -u nginx -n 10** (To see the LAST 10 logs)
- **journalctl -u nginx -f** (To see the real-time logs, same as tail -f)
- **journalctl -u nginx > log.txt** (To save the log in a file and share where it concerns)

### Scenario 4: File Permissions Issue
- **ls -altS** (ls -l will also work to check file permissions)
  - Note: **r** - read (Needed when reading a file), **w** - write (To edit the file), **x** - execute (To run a file, e.g., ./python test.py)
  - Note: If we want to go inside a folder using the **cd** command, we need **x** (execute) permission on the folder for the user.

   





















