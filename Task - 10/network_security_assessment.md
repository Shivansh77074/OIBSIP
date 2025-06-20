# 🛡️ Network Security Assessment Report

## 📌 Task 10: Detailed Security Assessment of a Network

### 🎯 Objective
To assess the security of a local/test network by scanning for vulnerabilities and analyzing captured traffic using Nmap and Wireshark.

---

## 🛠 Tools Used

- **Nmap 7.95** – Port scanning and service detection
- **Wireshark** – Packet capturing and network traffic analysis
- **OS** – Kali Linux

---

## 1️⃣ Nmap Network Scan

### 🔧 Command Used
```bash
nmap -sS -sV -O -oN nmap_results.txt 192.168.1.19
```

### 🧾 Scan Results Summary

| Parameter             | Result                          |
|-----------------------|----------------------------------|
| Target IP             | 192.168.1.19                     |
| Host Status           | Up                               |
| Open Port             | 80/tcp                           |
| Service on Port 80    | Apache httpd 2.4.63 (Debian)     |
| OS Detected           | Linux 2.6.32 / 5.X / 6.X          |
| Network Distance      | 0 hops (same local network)      |

### 🛡️ Observations

- Only **one open port (80)** was detected. This is a common HTTP port and expected on web servers.
- The Apache HTTP Server is visible to the network, which may be vulnerable if misconfigured or outdated.
- The operating system appears to be a variant of **Linux**, detected with multiple possible versions, increasing the fingerprint ambiguity.
- The low number of open ports indicates minimal exposure, which is good for reducing the attack surface.

---

## 2️⃣ Wireshark Traffic Capture

### 🧪 Procedure Followed

1. Started capture on the main network interface.
2. Visited websites to generate HTTP traffic.
3. Applied display filter: `http`
4. Stopped and saved capture as `wireshark_capture.pcapng`.

### 📊 Packet Analysis Highlights

| No.  | Source        | Destination     | Description                                |
|------|---------------|------------------|--------------------------------------------|
| 1207 | 192.168.1.4   | 34.223.124.45    | HTTP GET request                           |
| 1212 | 34.223.124.45 | 192.168.1.4      | HTTP 200 OK response                       |
| 1359 | IPv6 client   | IPv6 server      | GET /online over IPv6                      |
| 1369 | IPv6 server   | IPv6 client      | 301 Moved Permanently                       |
| 1374 | IPv6 client   | IPv6 server      | Follow-up GET /online/                     |
| 1391 | IPv6 server   | IPv6 client      | HTTP 200 OK - HTML content                 |
| 1422 | IPv6 server   | IPv6 client      | HTTP 200 OK - favicon served               |

### 🧠 Key Takeaways

- HTTP requests and responses were successfully captured.
- Standard web traffic includes redirects and asset requests (e.g., favicon).
- Some traffic used IPv6, highlighting dual-stack environment.
- No encrypted (HTTPS) traffic observed, indicating lack of confidentiality on this network segment.

---

## 🔐 Security Assessment Summary

| Area                  | Issue / Observation                             | Recommendation                         |
|-----------------------|--------------------------------------------------|-----------------------------------------|
| Web Server Exposure   | Apache HTTP server exposed on port 80           | Ensure server is updated & hardened     |
| Unencrypted Traffic   | HTTP traffic captured, no HTTPS observed        | Enforce HTTPS to protect data           |
| OS Fingerprinting     | Linux version inferred by Nmap                  | Consider obfuscating OS fingerprinting  |
| Limited Open Ports    | Only port 80 open, minimal attack surface       | Good security practice maintained       |

---

## ✅ Conclusion

This network security assessment revealed a mostly secure environment with limited services exposed. However, the lack of encryption in captured traffic and the publicly visible Apache service pose potential vulnerabilities. Adopting best practices like TLS encryption and regular service updates would further strengthen the network’s security posture.

---



## 🎬 Demo Video (Nmap)

[![Watch the demo](https://img.youtube.com/vi/6nuHNmiA0BU/0.jpg)](https://youtu.be/6nuHNmiA0BU)

🔗 [Click here to watch the video on YouTube](https://youtu.be/6nuHNmiA0BU)


---


## 🎬 Demo Video

[![Watch the demo](https://img.youtube.com/vi/wrM4zC31YE4/0.jpg)](https://youtu.be/wrM4zC31YE4)

🔗 [Click here to watch the video on YouTube](https://youtu.be/wrM4zC31YE4)
