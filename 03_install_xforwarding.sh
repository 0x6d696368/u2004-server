#!/bin/bash

apt -y install xterm 

sed 's/X11Forwarding no/X11Forwarding yes/g' -i /etc/ssh/sshd_config

cat >> /etc/ssh/sshd_config << EOF
X11UseLocalhost yes
AddressFamily inet
EOF

systemctl restart ssh

