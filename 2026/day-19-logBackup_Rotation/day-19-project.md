# Day 19 – Log Backup and Rotation Project

## Task 1: Backup and Log Rotation Script

**Objective:** Create a script to backup logs and implement rotation.

**Script:** `T1-backupAndRotation.sh`

### Execution Steps

1. Create the script: `touch T1-backupAndRotation.sh`
2. Make it executable: `chmod u+x T1-backupAndRotation.sh`
3. Run the script to perform backup and rotation.

### Output

![alt text](image.png)

---

## Task 2: Crontab Setup

**Objective:** Schedule the backup script to run automatically using cron.

### Steps to Configure Crontab

1. Open crontab editor: `crontab -e`
2. Select editor option 2 (nano or your preferred editor)
3. Add the cron expression for weekly execution at 00:00 on Saturday:
   ```
   0 0 * * 6 /path/to/T1-backupAndRotation.sh
   ```
4. Save and exit: `:wq!`

### Cron Expression Details

- **Expression:** `0 0 * * 6`
- **Meaning:** Runs at 00:00 (midnight) every Saturday
- **Tip:** Use [crontab.guru](https://crontab.guru) to generate and verify cron expressions.

### Verification

- Check your crontab entries: `crontab -l`

### Screenshots

- Crontab editor interface:
![alt text](image-1.png)

- Cron expression added:
![alt text](image-2.png)

---

## Summary

This project demonstrates:
- Creating automated backup scripts with log rotation
- Scheduling tasks using cron for regular maintenance
- Best practices for system administration scripts

