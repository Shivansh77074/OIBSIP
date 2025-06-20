# 🔍 Nikto Vulnerability Scan Report
---

## 🛠 Tool Used

- **Nikto v2.5.0**
---

## 🎯 Target Information

- **Host:** 127.0.0.1 (Local DVWA server)
- **Port:** 80
---

## 🧪 Scan Summary

The Nikto scan against the DVWA instance running locally on port 80 revealed several potential vulnerabilities and insecure configurations:
---

### ⚠️ Key Findings

1. **Missing Security Headers**
   - `X-Frame-Options` is missing — susceptible to clickjacking attacks.
   - `X-Content-Type-Options` is missing — allows MIME-type sniffing.
   - Reference: [Mozilla on X-Frame-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options), [Netsparker on Content-Type](https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/)

2. **Server Configuration Leaks**
   - **ETag headers** may leak file inode data: CVE-2003-1418.
   - **Allowed HTTP methods** include: `HEAD, GET, POST, OPTIONS`.

3. **File Disclosure & Misconfigurations**
   - Access to `/etc/hosts` through URLs like:
     - `GET ///etc/hosts`
     - Exploitable via various backdoor-like scripts.
   - Paths such as `/phpinfo.php` expose internal server info (CWE-552).
   - Apache `server-status` is publicly accessible, revealing sensitive server metrics.

4. **PHP File Managers & Backdoors Detected**
   - Malicious or unintended file managers present in:
     - `/wp-content/themes/twentyeleven/images/headers/server.php`
     - `/wp-includes/Requests/Utility/content-post.php`
     - `/assets/mobirise/css/meta.php`
     - `/shell`, `/login.cgi`, etc.
   - Some paths are related to remote command execution vulnerabilities on D-Link devices.
---

## 📌 Risk Implications

- **System Info Exposure:** Attackers can enumerate software versions and configuration.
- **Command Execution Risk:** Exposed scripts allow reading sensitive system files.
- **Unauthorized File Access:** Malicious file manager scripts present severe RCE/file disclosure risks.
- **Missing Headers:** Increases susceptibility to client-side attacks.

---
## ✅ Recommendations

- Remove or secure test/debug files like `phpinfo.php`.
- Add HTTP security headers (`X-Frame-Options`, `X-Content-Type-Options`).
- Disable unnecessary HTTP methods (`OPTIONS`, `TRACE`).
- Restrict access to Apache `/server-status`.
- Scan the file system for malware/backdoors and clean the environment.
- Apply strict file permission and input validation rules.
- Regularly audit and harden the server.

---
## 📂 Included Files

- `Nikto_scan_results.txt`: Full output of the scan.
- `README.md`: Analysis and mitigation suggestions.

---
## 🎬 Demo Video

[![Watch the demo](https://img.youtube.com/vi/CZpXKjzhnyI/0.jpg)](https://youtu.be/CZpXKjzhnyI)

🔗 [Click here to watch the video on YouTube](https://youtu.be/CZpXKjzhnyI)

---
**⚠️ Legal Notice:** This scan was conducted on a local test environment (DVWA) for educational purposes only. Never scan systems you don’t own or have explicit permission to test.
