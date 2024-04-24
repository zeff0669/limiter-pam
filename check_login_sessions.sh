#!/bin/bash
user="$PAM_USER"
limite=$(grep "$user" /root/usuarios.db | awk '{print $2}')
if [ -z "$limite" ]; then
    limite=1
elif ! [[ "$limite" =~ ^[0-9]+$ ]]; then
    limite=1
fi
if [ "$user" = "root" ]; then
    exit 0
elif [ "$(ps -ef | grep "sshd: $user" | grep priv | grep -v grep | grep -v " $user priv" | wc -l)" -gt "$limite" ]; then
    exit 1
else
    exit 0
fi
