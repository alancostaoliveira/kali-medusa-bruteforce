# 🔓 Kali Medusa Bruteforce Lab

Laboratório prático de segurança demonstrando ataques de força bruta com Medusa, Kali Linux, Metasploitable 2 e DVWA.

## 📋 Conteúdo

- [Início Rápido](#início-rápido)
- [Estrutura](#estrutura)
- [Documentação](#documentação)
- [Scripts](#scripts)
- [Licença](#licença)

## 🚀 Início Rápido

```bash
# Clone o repositório
git clone https://github.com/alancostaoliveira/kali-medusa-bruteforce.git
cd kali-medusa-bruteforce

# Configure o ambiente seguindo ENVIRONMENT_SETUP.md
chmod +x scripts/*.sh

kali-medusa-bruteforce/
├── README.md
├── ENVIRONMENT_SETUP.md
├── FTP_ATTACK.md
├── WEB_FORM_ATTACK.md
├── SMB_ATTACK.md
├── MITIGATION_RECOMMENDATIONS.md
├── LICENSE
├── wordlists/
│   ├── passwords.txt
│   └── users.txt
└── scripts/
    ├── ftp_bruteforce.sh
    ├── web_bruteforce.sh
    └── smb_enumeration.sh

