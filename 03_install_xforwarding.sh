#!/bin/bash

apt install -y xterm 

sed 's/X11Forwarding no/X11Forwarding yes/g' -i /etc/ssh/sshd_config

cat >> /etc/ssh/sshd_config << EOF
X11UseLocalhost no
EOF

systemctl restart ssh


