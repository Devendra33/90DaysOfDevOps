# Day 14 - Networking Basics

## Basic Networking Commands

Here are some essential commands for networking troubleshooting:

- **`hostname -i`** - Displays the private IP address of the server.
- **`traceroute <url>`** - Shows all the hops (paths) to reach the destination. Useful for identifying where the network is dropping or slow.
- **`netstat` or `ss -tulnp`** - Lists open ports and listening services.
- **`nslookup` or `dig`** - Provides DNS resolution IP (A record entry).
- **`curl -i <url>`** - Sends a request to the server and displays the response, including status codes.
- **`netstat -an`** - Shows all listening ports with service names (active/inactive ports).

## Port Checking Examples

- **`nc -zv localhost <port>`** - Checks if localhost is listening on a specific port.
  - Example: `nc -zv localhost 22`
    - Output: `Connection to localhost (127.0.0.1) 22 port [tcp/ssh] succeeded!`
- **`curl -i localhost:<port>`** - Alternative way to check port connectivity.

## Troubleshooting Questions

**Question:** What layer (OSI/TCP-IP) would you inspect next if DNS fails? If HTTP 500 shows up?

**Answer for DNS Failure:**
- If DNS fails, check Layer 7 (Application Layer) using `nslookup` or `dig`.

**Answer for HTTP 500:**
- HTTP 500 indicates a server-side failure, meaning the request reached the server successfully.
- **Why:** The network is working (DNS + TCP connection succeeded).
- **Problem areas:**
  - Web server (e.g., Nginx/Apache)
  - Backend application (code, API, database)
- **What to check next:**
  - Server logs (e.g., Nginx, application logs)
  - Backend service health
  - Database connectivity
  - Recent deployments