## OSI layers (L1–L7) vs TCP/IP stack (Link, Internet, Transport, Application)

![alt text](image.png)
![alt text](image-1.png)
![alt text](image-2.png)

## IP - Internet Protocols

![alt text](image-3.png)
![alt text](image-4.png)

## Ports and Protocols

![alt text](image-5.png)
![alt text](image-6.png)

### TCP/ UDP:

 - **TCP**: Stands for Transmission Control Protocol. it is slower but reliable in case of transferring the data (connection-oriented). used where data loss is not acceptable. example - loading of web page.

 - **UDP**: Stands for User Datagram Protocol. it is faster but Not relialable in case of transferring the data. used where data loss is kind of acceptable (connectionless-oriented). example - video calling, streaming.

 ### DNS:
![alt text](image-7.png) 
![alt text](image-8.png)

### Firewall and Security Groups

![alt text](image-9.png)

 - **sudo ufw status** - it is used to check the status of firewall

 **Mistake** - Opening all traffic (0.0.0.0/0) to fix a connection issue.
 **Correction** - only permit particular ports to ips to pass through firewall which needs access to server

### NATs and Gateways

![alt text](image-10.png)
![alt text](image-11.png)

### L4 VS L7 LoadBalancing

![alt text](image-12.png)
![alt text](image-13.png)


### Reverse Proxy and Forward proxy.

![alt text](image-14.png)
![alt text](image-15.png)

### Networking and Cloud

![alt text](image-16.png)
![alt text](image-17.png)

### Kubernetes and Containers Networking
![alt text](image-18.png)
![alt text](image-19.png)
![alt text](image-20.png)
![alt text](image-21.png)

**COMMON MISTAKE** - Assuming failed ping means the server is down.
**Correction** - Many firewalls blocks ping (ICMP) for security. use telnet or nc to check specific ports instead.

### Troubleshooting Hand Book

![alt text](image-22.png)
![alt text](image-23.png)









