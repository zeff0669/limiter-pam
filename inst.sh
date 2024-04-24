#!/bin/bash

#wget 


echo "auth required pam_exec.so /usr/local/bin/check_login_sessions.sh" >> /etc/pam.d/sshd
