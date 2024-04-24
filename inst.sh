#!/bin/bash
wget -O /usr/local/bin/limiter-pam https://github.com/zeff0669/limiter-pam/raw/main/limiter-pam
chmod +x /usr/local/bin/limiter-pam

if [ -f /usr/local/bin/limiter-pam ]; then
    #echo "auth required pam_exec.so /usr/local/bin/check_login_sessions.sh" >> /etc/pam.d/sshd
    echo "account required pam_exec.so quiet /usr/local/bin/check_login_sessions.sh" >> /etc/pam.d/sshd
    echo "account required pam_echo.so LIMITE DE CONEXÕES DE ATINGIDO" >> /etc/pam.d/sshd
    echo "ClientAliveInterval 2" >> /etc/ssh/sshd_config
    echo "ClientAliveCountMax 1" >> /etc/ssh/sshd_config
    systemctl restart ssh
fi
