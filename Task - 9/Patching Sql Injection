
# 🛠️ Patching SQL Injection Vulnerability in DVWA

## 🔍 Introduction

**SQL Injection** is one of the most dangerous and common web application vulnerabilities. This document explains how to patch a basic SQL Injection vulnerability found in the **DVWA (Damn Vulnerable Web Application)** under the **SQL Injection (Low)** module.

---

## ⚠️ Problem Overview

The `User ID` input in DVWA’s SQL Injection module allows user-controlled data to be directly injected into SQL queries.

### ❌ Vulnerable SQL Query:

```sql
SELECT first_name, last_name FROM users WHERE id = '$id';
```

### 💣 Exploit Payload:

```
1 OR 1=1 -- -
```

---

## 🧩 Patch Strategy

To mitigate SQL Injection vulnerabilities, apply secure coding practices and layered defense strategies as outlined below:

---

### ✅ 1. Use Prepared Statements / Parameterized Queries

**Prepared statements** prevent SQL code and user input from mixing.

#### PHP (PDO):
```php
$id = $_GET['id'];
$stmt = $pdo->prepare("SELECT first_name, last_name FROM users WHERE id = ?");
$stmt->execute([$id]);
$data = $stmt->fetchAll();
```

#### PHP (MySQLi):
```php
$id = $_GET['id'];
$stmt = $conn->prepare("SELECT first_name, last_name FROM users WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
```

---

### ✅ 2. Input Validation and Sanitization

Always validate that inputs are of the expected type and format.

```php
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
```

---

### ✅ 3. Use Stored Procedures

Move SQL logic into the database to reduce injection risks.

```sql
CREATE PROCEDURE getUserById(IN userId INT)
BEGIN
  SELECT first_name, last_name FROM users WHERE id = userId;
END;
```

---

### ✅ 4. Principle of Least Privilege

Limit database permissions:

- ❌ Don’t use root or admin accounts.
- ✅ Grant only the necessary permissions (e.g., `SELECT` only).

---

### ✅ 5. Implement a Web Application Firewall (WAF)

Use tools like:

- 🔐 **ModSecurity**
- ☁️ **AWS WAF**
- 🌐 **Cloudflare**

These can detect and block known SQL injection payloads.

---

## 📊 Summary Table

| Vulnerability             | Secure Practice               |
|---------------------------|-------------------------------|
| Raw SQL Queries           | Use Prepared Statements       |
| No Input Filtering        | Validate and Sanitize Input   |
| Overprivileged Accounts   | Enforce Least Privilege       |
| Direct SQL Query Access   | Use Stored Procedures         |
| No Layered Defense        | Deploy a WAF                  |

---

## ✅ Conclusion

**SQL Injection vulnerabilities** can compromise an entire database if left unpatched. By using:

- Prepared statements
- Input validation
- Least privilege
- Stored procedures
- Web firewalls

you can **significantly reduce** the risk of SQL Injection attacks.

> Securing user inputs and avoiding dynamic SQL queries is not just a best practice—it is essential for protecting user data and maintaining the integrity of your application.

---
