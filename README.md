# 🔍 SQLMap Automation Bash Script

A powerful Bash script that automates SQL injection testing using [sqlmap](https://github.com/sqlmapproject/sqlmap). Designed for **authorized penetration testing**, this tool streamlines scanning with support for:

- ✅ URL scanning
- ✅ Cookie/session injection
- ✅ Proxy routing (e.g., Burp Suite, TOR)
- ✅ Tamper scripts for WAF evasion
- ✅ Crawl and form scanning
- ✅ ShellCheck-compliant

> ⚠️ **For legal use only.** You must have explicit authorization to test any target with this tool. Unauthorized use is illegal.

---

## 📦 Features

- 🔗 Scan any URL with optional cookie and proxy support
- 🕵️ Crawls up to 3 levels deep and scans all forms
- 🧠 Uses `--smart` mode and random user-agent
- 🛡️ Optional tamper script support to bypass WAFs
- 📁 Results saved to a `sqlmap_logs` folder
- ✅ ShellCheck-clean and secure

---

## 🚀 Usage

### 📜 Basic Command

```bash
./Ad_Sql.sh <url> [cookies] [proxy] [tamper_script]

💡 Examples

# Simple scan
./Ad_Sql.sh "http://example.com"

# With cookies
./Ad_Sql.sh.sh "http://example.com" "PHPSESSID=abc123"

# With proxy (Burp/TOR)
./Ad_Sql.sh.sh "http://example.com" "" "http://127.0.0.1:8080"

# With tamper scripts
./Ad_Sql.sh.sh "http://example.com" "" "" "space2comment,between"

# All combined
./Ad_Sql.sh.sh "http://example.com" "PHPSESSID=abc123" "http://127.0.0.1:8080" "space2comment,between"

📁 Output
All scan results are saved in:
sqlmap_logs/


✅ Requirements
sqlmap
Bash 4+

Install sqlmap via:
sudo apt install sqlmap        # Debian/Ubuntu
# or
git clone https://github.com/sqlmapproject/sqlmap


🔐 Legal Disclaimer
This tool is intended for legal security testing and educational purposes only. You are responsible for obtaining proper authorization before testing any system. Misuse can be illegal and unethical.
