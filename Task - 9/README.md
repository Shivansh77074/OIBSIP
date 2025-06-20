# Task 9: SQL Injection Exploitation in DVWA
---
## 🔍 Objective
Demonstrate a successful SQL Injection attack on the DVWA application and explain how to patch the vulnerability.

---

## 🧪 Setup

- **Platform**: DVWA (Damn Vulnerable Web Application)
- **Security Level**: Low
- **Target Module**: `SQL Injection`
- **Access URL**: `http://localhost/DVWA/vulnerabilities/sqli/`

---

## 🎬 Demo Video

[![Watch the demo](https://img.youtube.com/vi/a0sOqOdlbpU/0.jpg)](https://youtu.be/a0sOqOdlbpU)

🔗 [Click here to watch the video on YouTube](https://youtu.be/a0sOqOdlbpU)

---

## 💥 Exploit Details

### 🔓 Injection Point

The `User ID` input field is vulnerable, as it accepts user-controlled input directly into an SQL query without proper validation.

### 🧨 Payload Used

```sql
1 OR 1=1 UNION SELECT user, password FROM users#

