
# 🕵️‍♂️ Task 8: Capture Network Traffic with Wireshark

## 📌 Objective

To capture and analyze HTTP network traffic using Wireshark.

---

## 🛠 Tools Used

- **Wireshark**: A powerful network protocol analyzer used to monitor and inspect network packets.

---

## 🔧 Steps Followed

1. Installed Wireshark on the system.
2. Started packet capture on the active network interface.
3. Visited a website in the browser to generate HTTP traffic.
4. Applied the display filter:
   ```
   http
   ```
5. Stopped the capture and saved the output as `wireshark_capture.pcap`.
6. Analyzed HTTP request and response details in captured packets.

---

## 📊 Packet Analysis Summary

The following important packets were captured during the session:

| No.  | Source           | Destination      | Description                          |
|------|------------------|------------------|--------------------------------------|
| 1207 | 192.168.1.4       | 34.223.124.45     | `GET / HTTP/1.1` - Client sends HTTP request |
| 1212 | 34.223.124.45     | 192.168.1.4       | `HTTP/1.1 200 OK` - Server response (text/html) |
| 1359 | 2401:4900:8fe...  | 2600:1f13:37c...  | `GET /online HTTP/1.1` - HTTP GET over IPv6 |
| 1369 | 2600:1f13:37c...  | 2401:4900:8fe...  | `301 Moved Permanently` - Redirection |
| 1374 | 2401:4900:8fe...  | 2600:1f13:37c...  | `GET /online/ HTTP/1.1` - Follow-up request |
| 1391 | 2600:1f13:37c...  | 2401:4900:8fe...  | `HTTP/1.1 200 OK` - Page loaded (text/html) |
| 1396 | 2401:4900:8fe...  | 2600:1f13:37c...  | `GET /favicon.ico HTTP/1.1` - Request for favicon |
| 1422 | 2600:1f13:37c...  | 2401:4900:8fe...  | `HTTP/1.1 200 OK` - PNG favicon served |

---

## 🧠 Observations

- A standard HTTP GET request (`GET /`) was sent to the server.
- The server responded with a successful `200 OK` along with HTML content.
- A redirection (`301 Moved Permanently`) occurred during a request to `/online`.
- The browser automatically followed the redirect.
- Favicon was requested and successfully loaded.
- Some of the traffic occurred over IPv6.

---

## 📁 Deliverables

- `wireshark_capture.pcap` – Saved capture file containing HTTP traffic.
- `README.md` – Documentation of the task and analysis.

---

## ✅ Conclusion

Wireshark allowed us to visually inspect the HTTP request-response cycle in detail. This hands-on task deepened understanding of how clients interact with servers, how redirects work, and how content is served over the network. This kind of network traffic analysis is crucial for troubleshooting and cybersecurity investigations.

---
