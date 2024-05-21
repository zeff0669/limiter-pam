#!/bin/bash
#Author: https://github.com/zeff0669
wget -O /usr/local/bin/limiter-pam https://github.com/zeff0669/limiter-pam/raw/main/limiter-pam >/dev/null 2>&1
chmod +x /usr/local/bin/limiter-pam >/dev/null 2>&1

if [ -f /usr/local/bin/limiter-pam ]; then
    #echo "auth required pam_exec.so /usr/local/bin/limiter-pam" >> /etc/pam.d/sshd
    echo "account required pam_exec.so quiet /usr/local/bin/limiter-pam" >> /etc/pam.d/sshd
    echo "account required pam_echo.so LIMITE DE CONEXÕES ATIVADO" >> /etc/pam.d/sshd
    echo "account required pam_exec.so quiet /usr/local/bin/limiter-pam" >> /etc/pam.d/other
    echo "account required pam_echo.so LIMITE DE CONEXÕES ATIVADO" >> /etc/pam.d/other
    echo "ClientAliveInterval 2" >> /etc/ssh/sshd_config
    echo "ClientAliveCountMax 1" >> /etc/ssh/sshd_config
    echo "ClientAliveInterval 2" >> /etc/hpnssh/sshd_config
    echo "ClientAliveCountMax 1" >> /etc/hpnssh/sshd_config
    systemctl restart ssh 
    systemctl restart hpnssh
    echo "INSTALADO COM SUCESSO"
fi

