#!/bin/bash

apt update

## ssh
apt install -y openssh-server
rm -r /etc/ssh/*
ssh-keygen -t ed25519 -N "" -f /etc/ssh/ssh_host_ed25519_key # re-generate public key
#TODO: yum -y install policycoreutils-python-utils

# COPY CONFIGURATION FILES
mkdir -p /etc
mkdir -p /etc/ssh
cat > /etc/ssh/sshd_config << PASTECONFIGURATIONFILE
# change port, obscurity is a valid security layer!
Port 226

# VERBOSE login to log user's key fingerprints on login.
LogLevel VERBOSE
SyslogFacility AUTHPRIV

Protocol 2

HostKey /etc/ssh/ssh_host_ed25519_key
AuthorizedKeysFile %h/.ssh/authorized_keys
#RevokedKeys /etc/ssh/revokeyd_keys # TODO: check if this works

PermitRootLogin prohibit-password # NOTE: change to 'no' for multiuser system
UsePAM yes

AuthenticationMethods publickey #,keyboard-interactive # TODO: do 2FA
PubkeyAuthentication yes
PermitEmptyPasswords no
HostbasedAuthentication no
PasswordAuthentication no
ChallengeResponseAuthentication no
KerberosAuthentication no
GSSAPIAuthentication no
#ExposeAuthenticationMethods never

X11Forwarding no
IgnoreRhosts yes

StrictModes yes
UsePrivilegeSeparation sandbox

MaxAuthTries 1

PASTECONFIGURATIONFILE
# COPY CONFIGURATION FILES

# make u- scripts executable
chmod u+x /usr/local/sbin/u-*

SSH_PORT="$(grep -E '^Port [0-9]+' /etc/ssh/sshd_config | grep -oE '[0-9]+' | head -n1)"

#semanage port -a -t ssh_port_t -p tcp ${SSH_PORT}
ufw allow ${SSH_PORT}/tcp

ufw limmit ${SSH_PORT}/tcp
# rate limit tcp connections to SSH on ${SSH_PORT}/tcp to 3 per minute
#firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT_direct 10 -p tcp --dport ${SSH_PORT} -m state --state NEW -m recent --set --name SSH_RATELIMIT
#firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT_direct 11 -p tcp --dport ${SSH_PORT} -m state --state NEW -m recent --update --seconds 60 --hitcount 4 -j REJECT --reject-with tcp-reset --name SSH_RATELIMIT
#firewall-cmd --permanent --direct --add-rule ipv6 filter INPUT_direct 10 -p tcp --dport ${SSH_PORT} -m state --state NEW -m recent --set --name SSH_RATELIMIT
#firewall-cmd --permanent --direct --add-rule ipv6 filter INPUT_direct 11 -p tcp --dport ${SSH_PORT} -m state --state NEW -m recent --update --seconds 60 --hitcount 4 -j REJECT --reject-with tcp-reset --name SSH_RATELIMIT
systemctl --no-pager start ssh
systemctl --no-pager enable ssh
systemctl --no-pager reload ssh
systemctl --no-pager status ssh # check status [optional]
ufw enable

