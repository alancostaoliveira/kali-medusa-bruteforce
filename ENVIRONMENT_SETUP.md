# Environment Setup Guide for Kali Medusa Bruteforce

This document provides a comprehensive environment configuration guide for setting up your system to use the Kali Medusa Bruteforce tool effectively.

## 1. VirtualBox Setup

VirtualBox is a free and open-source virtualization tool that allows you to run multiple operating systems on your computer. Follow these steps to set it up:

### 1.1 Download and Install VirtualBox
- Go to the [VirtualBox website](https://www.virtualbox.org/).
- Download the appropriate version for your operating system.
- Follow the installation instructions provided on the website.

### 1.2 Create a New Virtual Machine
- Open VirtualBox and click on `New`.
- Name your VM (e.g., Kali Linux), select `Linux` as the type, and `Debian (64-bit)` as the version.
- Allocate memory (RAM) to your VM (recommended: at least 2048 MB).
- Create a virtual hard disk and allocate at least 20 GB of space.

## 2. Network Configuration for Kali Linux and Metasploitable 2

To effectively use both Kali Linux and Metasploitable 2, you need to configure your network settings:

### 2.1 Set up Network for Kali Linux
- Go to your VM settings and navigate to the `Network` section.
- Enable `Adapter 1`, set it to `Bridged Adapter`, and select your network interface.

### 2.2 Set up Network for Metasploitable 2
- Follow the same steps as above to set up Metasploitable 2. Ensure both VMs are on the same network segment for accessibility.

## 3. DVWA Installation (Damn Vulnerable Web Application)

DVWA is a PHP/MySQL web application that is damn vulnerable. To install it on your Kali Linux:

### 3.1 Install Required Packages
```bash
sudo apt-get update
sudo apt-get install apache2 mysql-server php php-mysql libapache2-mod-php git
```

### 3.2 Download DVWA
```bash
cd /var/www/html/
sudo git clone https://github.com/digininja/DVWA.git
```

### 3.3 Set Permissions
```bash
sudo chown -R www-data:www-data DVWA/
sudo chmod -R 755 DVWA/
```

### 3.4 Configure Database
- Start MySQL:
```bash
sudo service mysql start
```
- Access MySQL:
```bash
sudo mysql -u root -p
```
- Create DVWA database:
```sql
CREATE DATABASE dvwa;
```
- Exit MySQL:
```sql
EXIT;
```

### 3.5 Edit Configuration File
- Open `config/config.inc.php` in the DVWA directory and set the database credentials:
```php
$_DVWA[ 'db_user' ] = 'root';
$_DVWA[ 'db_password' ] = 'your_password';
```

### 3.6 Start Apache
```bash
sudo service apache2 start
```

- Access DVWA via your web browser at `http://<Kali_IP_Address>/DVWA/`.

## 4. Troubleshooting Steps

If you encounter issues during setup, follow these troubleshooting steps:

- Ensure your virtual machines are running and properly networked.
- Check if Apache and MySQL services are running on Kali Linux using:
```bash
sudo service apache2 status
sudo service mysql status
```
- Verify that the correct credentials are configured in the DVWA settings.
- Review Apache error logs located at `/var/log/apache2/error.log` for any specific errors.

---

By following the steps outlined in this document, you should be able to successfully set up and configure your environment for using the Kali Medusa Bruteforce tool effectively.