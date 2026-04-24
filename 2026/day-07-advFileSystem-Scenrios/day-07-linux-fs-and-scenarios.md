## Core Directories (Must Know):
- `/` (root) - The starting point of everything
- `/home` - User home directories
- `/root` - Root user's home directory
- `/etc` - Configuration files
- `/var/log` - Log files (very important for DevOps!)
- `/tmp` - Temporary files

## Additional Directories (Good to Know):
- `/bin` - Essential command binaries
- `/usr/bin` - User command binaries
- `/opt` - Optional/third-party applications, contains the source code

## Find the largest log file in /var/log

 - ls -lSh (l - long listing, capital S - for sorting file size, h for converting kb to MB/GB)

 - sudo du -ah / | sort -rh | head -n 10 (Gives top 10 files/ folders biggest file size folder on the VM) 
    note - du will works on both files and folder and find work on only files (No folders)
    note - du -ah () | sort -r(reverse oder - sorts decending order, -h means human readable form).

 - remove file/ folder rm file.txt (use -r flag for removing directories)

# Working with services

## For Scenario 1: Service Not Starting (Before/ After Reboot)

**Hint:** 

- First check: Is the service running or failed?
- Then check: What do the logs say?
- Finally check: Is it enabled to start on boot?

 - systemctl status nginx (shows the status of the service - active, stopped, etc)
 - systemctl start nginx (Start the service, does not gaurantee service keeps running after reboot)
 - systemctl stop nginx (Stop the service)
 - systemctl is-enabled nginx (shows the service is enabled or not, can be also seen in status in the value of Loaded)
 - systemctl list-units --type=service (shows all the services on the system)

  - Note:
  - status=static (it depends on the service to start)
  - status=masked (we can never enable it to auto start on re-boot, until we unmask it)
        even if the service is masked we it can still be active but after reebot it will not automatically start.
        To unmask it - sudo systemctl unmask nginx

## For Scenario 2:  High CPU Usage (application server is slow)

 - ps aux --sort=-%cpu | head -n 10 (Gives top 10 process using most cpu)
 - ps aus --sort=-%mem | head -n 10 (Gives top 10 process using most memory)
 - htop - we can see process using this command also but it not work with grep

 if some not required process high mem/ cpu then kill the process
 - kill -9 PID

 ## For Scenario 3: Finding Service Logs (Investing issue of service)

 First check the serivce is availble
  - systemctl status nginx

  - journalctl -u ngnix (To see the logs)
  - journalctl -u nginx -n 10 (To see the LAST 10 logs)
  - journalctl -u nginx -f (To see the real-time logs same as tail -f)
  - journalctl -u nginx > log.txt (To save the log in file and we can share where it concerns)


## For Scenario 4: File Permissions Issue

 - ls - altS [ls -l will also work to check file permissions] 
   Note: (r) - read (Needs when reading a file), (w) -write (To Edit the file), (x) -execute (To Run a file (./python test.py))
   Note: if we want to go inside a folder using (cd command) we need x (execute) permission of file on the user.

   





















