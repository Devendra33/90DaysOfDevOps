# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Overview

Build on Day 14 by understanding the building blocks of networking every DevOps engineer must know.

### Learning Objectives

By the end of this day, you will:

- Understand how **DNS** resolves names to IPs
- Learn **IP addressing** (IPv4, public vs private)
- Break down **CIDR notation** and **subnetting** basics
- Know common **ports** and why they matter

This is concept-focused — research, understand, and document in your own words.

---

## Expected Output

You will create: `day-15-networking-concepts.md`

---

## Challenge Tasks

### Task 1: DNS – How Names Become IPs

Understand the DNS resolution process and record types.

**Questions:**

1. Explain in 3–4 lines: what happens when you type `google.com` in a browser?
2. What are these DNS record types? Write one line each:
   - `A` — 
   - `AAAA` — 
   - `CNAME` — 
   - `MX` — 
   - `NS` — 

**Hands-On:**

Run the following command and identify the A record and TTL:
```bash
dig google.com
```

---

### Task 2: IP Addressing

Understand the fundamentals of IPv4 addressing and public vs. private IPs.

**Questions:**

1. What is an IPv4 address? How is it structured? (e.g., `192.168.1.10`)
2. What is the difference between **public** and **private** IPs? Provide one example of each.
3. What are the standardized private IP ranges?
   - `10.x.x.x`
   - `172.16.x.x – 172.31.x.x`
   - `192.168.x.x`

**Hands-On:**

Run the following command and identify which of your IPs are private:
```bash
ip addr show
```

---

### Task 3: CIDR & Subnetting

Learn CIDR notation and how subnetting works in networking.

**Questions:**

1. What does `/24` mean in `192.168.1.0/24`?
2. How many usable hosts in a `/24`? A `/16`? A `/28`?
3. Explain in your own words: why do we subnet?

**Exercise:**

Fill in the following CIDR reference table:

| CIDR | Subnet Mask | Total IPs | Usable Hosts |
|------|-------------|-----------|--------------|
| /24  | ?           | ?         | ?            |
| /16  | ?           | ?         | ?            |
| /28  | ?           | ?         | ?            |

---

### Task 4: Ports – The Doors to Services
1. What is a port? Why do we need them?
2. Document these common ports:

| Port | Service |
|------|---------|
| 22   | ?       |
| 80   | ?       |
| 443  | ?       |
| 53   | ?       |
| 3306 | ?       |
| 6379 | ?       |
| 27017| ?       |

3. Run `ss -tulpn` — match at least 2 listening ports to their services

---

### Task 5: Putting It Together
Answer in 2–3 lines each:
- You run `curl http://myapp.com:8080` — what networking concepts from today are involved?
- Your app can't reach a database at `10.0.1.50:3306` — what would you check first?

---

## Documentation

Create `day-15-networking-concepts.md` with:
- Your answers to each task
- Command outputs from `dig` and `ss`
- The filled CIDR table
- What you learned (3 key points)

---

## Submission
1. Add `day-15-networking-concepts.md` to `2026/day-15/`
2. Commit and push to your fork

---

## Learn in Public

Share what you learned about DNS, subnets, or ports on LinkedIn.

```
#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
```

Happy Learning!
**TrainWithShubham**
