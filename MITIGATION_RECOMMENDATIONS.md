# Mitigation Recommendations Against Brute Force Attacks

## 1. Rate Limiting with iptables
Configure iptables to limit the number of connection attempts from a single IP address. For example:
```bash
iptables -A INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --set
iptables -A INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 5 -j DROP
```

## 2. Account Lockout with PAM
Use PAM (Pluggable Authentication Module) to lock out user accounts after a specified number of failed login attempts. Modify `/etc/pam.d/sshd`:
```bash
auth required pam_tally2.so deny=5 unlock_time=900
```

## 3. Port Changes
Change the default SSH port (22) to a non-standard port to reduce exposure. Edit `/etc/ssh/sshd_config`:
```bash
Port 2222
```

## 4. Fail2Ban Configuration
Install and configure Fail2Ban to monitor logs and ban IPs that show malicious signs. Example configuration for SSH:
```ini
[sshd]
enabled = true
port = 2222
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
bantime = 3600
```

## 5. Monitoring and Logging Strategies
Implement monitoring solutions such as:
- **Logwatch**: For daily log summaries.
- **OSSEC**: For intrusion detection and real-time alerting.
Monitor auth logs with:
```bash
tail -f /var/log/auth.log
```

## 6. Multi-Factor Authentication (MFA)
Enable MFA for SSH access. Use Google Authenticator or another TOTP app to generate codes. Install the necessary packages and configure.

## 7. Firewall Rules
Implement strict firewall rules. An example using UFW:
```bash
ufw default deny incoming
ufw default allow outgoing
ufw allow 2222/tcp
```

## 8. Password Policies
Enforce strong password policies:
- Minimum length of 12 characters
- At least one uppercase letter, one lowercase letter, one number, and one special character
- Regular password changes

## Conclusion
Implementing these measures significantly enhances security and reduces the risk of brute force attacks.