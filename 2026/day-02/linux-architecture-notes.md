# Day 02 - Assignment By - Devendra Gohare

## The core components of Linux (kernel, user space, init/systemd) 

**Kernel** - it is a software between user interface [CLI] and Hardware of the machine. it process the input commands by user and convert it to binary (Machine Language) and manages hardware according to it.
    To see kernel version: uname -r

**User space** - it is a restriced space, unpreviliaged area where application run - it is isolated from core linux operation.
It provides better security and stability by preventing applications to intract with hardware directly or interfering with other services.

**init/systemd** - It is first process start by the OS with PID = 1 during the boot sequence

### How processes are created and managed

- Every running program instance linux is a process.
- everything is either a file or a folder.
- Everything started from a file called as root (/) 

- What systemd does and why it matters
    systemd is used to manage system settings and services, it unfies configuration, monitoring and logging across systems

- Service Management: It starts, stops, and restarts background services (daemons), often on-demand to speed up boot times.
Dependency Tracking: It starts services in parallel, using dependency-based logic to ensure services start only when needed.
Logging and Journaling: Provides systemd-journald, a centralized system logging utility.
Hardware and Mount Management: It manages device mounting and tracks processes using Linux control groups (cgroups)

## Explain **process states** (running, sleeping, zombie, etc.)

**Process States:** \
Running (R) - The process is currently executing
Stopped (S)- Process is terminated
Zomibe(Z) -is a process that has completed its execution but still has an entry in the system's process table. It is effectively "dead" but hasn't been removed from the system because its parent process has not yet read its exit status.

## List **5 commands** you would use daily

**I found this 5 commands very usefull:**

cd \
ls \
mkdir \
touch \
grep













