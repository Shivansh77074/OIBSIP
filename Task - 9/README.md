# Task 9: SQL Injection Exploitation in DVWA

## 🔍 Objective
Demonstrate a successful SQL Injection attack on the DVWA application and explain how to patch the vulnerability.

---

## 🧪 Setup

- **Platform**: DVWA (Damn Vulnerable Web Application)
- **Security Level**: Low
- **Target Module**: `SQL Injection`
- **Access URL**: `http://localhost/DVWA/vulnerabilities/sqli/`

---

## 💥 Exploit Details

### 🔓 Injection Point

The `User ID` input field is vulnerable, as it accepts user-controlled input directly into an SQL query without proper validation.

### 🧨 Payload Used

```sql
1 OR 1=1 UNION SELECT user, password FROM users#
