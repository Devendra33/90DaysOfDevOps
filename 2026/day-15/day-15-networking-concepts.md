# Day 15 - Networking Concepts: DNS, IP, Subnets & Ports

## Task 1: DNS – How Names Become IPs

### What happens when you type `google.com` in a browser?

It communicates with a DNS server to resolve/find its IP address. Once found, DNS sends back the IP to the client, and we can see the web page for Google.

### DNS Record Types

- **`A` (Address Record)**: Maps a domain name to an IPv4 address.
- **`AAAA` (Quad A Record)**: Maps a domain name to an IPv6 address.
- **`CNAME` (Canonical Name)**: Maps a domain name to an alias name, not directly pointing to the IP. The alias may point to the IP.
- **`MX` (Mail Exchange)**: Specifies mail servers responsible for receiving emails.
- **`NS` (Name Server)**: Defines the authoritative DNS servers for a domain.

### Command Output: `dig google.com`

To see the TTL using dig command:
```bash
dig google.com +ttlunits
```
- Shows 4m as TTL time.

## Task 2: IP Addressing

### 1. What is an IPv4 address? How is it structured?

An IPv4 address is an address assigned to a machine so it can access the internet. It is structured as four octets separated by dots, e.g., `192.168.1.10`.

### 2. Difference between Public and Private IPs

- **Public IP**: An IP that faces public traffic or is exposed publicly to everyone. Example: Web application such as amazon.com.
- **Private IP**: An IP that is only accessible within internal network devices, not exposed to the public. Example: Database of amazon.com should have a private IP address so it cannot be accessible by the public and stays protected from the external world.

### 3. Private IP Ranges

- `10.x.x.x`
- `172.16.x.x – 172.31.x.x`
- `192.168.x.x`

Private IPs will be assigned to devices within these ranges only.

### 4. Command Output: `ip addr show`

Run: `ip addr show` — Identify which of your IPs are private.

*(Image placeholder: image.png)*

Note: `ifconfig` also shows the same details.

## Task 3: CIDR & Subnetting

### 1. What does `/24` mean in `192.168.1.0/24`?

It means 32-24 = 8, so 2^8 = 256 available IP addresses to assign/it can have 256 hosts. 2 addresses are reserved for internal purposes such as broadcasting and network address. So, actually, it can host 254 hosts.

### 2. Usable Hosts

- **/24**: 256 - 2 = 254 usable addresses
- **/16**: 65,536 - 2 = 65,534 usable addresses
- **/28**: 16 - 2 = 14 usable addresses

### 3. Why do we subnet?

It lets us manage networks easily and provides an isolated environment.

### 4. CIDR Reference Table

| CIDR | Subnet Mask     | Total IPs | Usable Hosts |
|------|-----------------|-----------|--------------|
| /24  | 255.255.255.0  | 256      | 254         |
| /16  | 255.255.0.0    | 65,536   | 65,534      |
| /28  | 255.255.255.240| 16       | 14          |

## Task 4: Ports – The Doors to Services

### 1. What is a port? Why do we need them?

A port is a communication endpoint that allows different services to run on the same IP address. We need them to distinguish between different network services and applications.

### 2. Common Ports

| Port | Service |
|------|---------|
| 22   | SSH     |
| 80   | HTTP    |
| 443  | HTTPS   |
| 53   | DNS     |
| 3306 | MySQL   |
| 6379 | Redis   |
| 27017| MongoDB |

### 3. Command Output: `ss -tulpn`

Run `ss -tulpn` — Match at least 2 listening ports to their services.

*(Image placeholder: image-1.png)*

## Task 5: Putting It Together

### You run `curl http://myapp.com:8080` — what networking concepts from today are involved?

DNS resolution, IP routing, and HTTP request/response over port 8080 across OSI layers (L7–L1).

### Your app can't reach a database at `10.0.1.50:3306` — what would you check first?

1. Check the firewall.
2. Test the port using telnet/nc command: `telnet 10.0.1.50 3306` or `nc -zv 10.0.1.50 3306`.
3. Check the database logs.
