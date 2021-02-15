#!/bin/bash

apt update
apt install -y cockpit cockpit-machines virt-manager bridge-utils
systemctl --no-pager start cockpit.socket
systemctl --no-pager enable cockpit.socket
systemctl --no-pager status cockpit.socket
systemctl --no-pager start libvirtd
systemctl --no-pager enable libvirtd
systemctl --no-pager status libvirtd

#firewall-cmd --permanent --add-service cockpit
#firewall-cmd --reload

modprobe -r kvm_intel
modprobe kvm_intel nested=1

# COPY CONFIGURATION FILES
mkdir -p /etc
mkdir -p /etc/modprobe.d
mkdir -p /etc/systemd
mkdir -p /etc/systemd/system
mkdir -p /etc/systemd/system/cockpit.socket.d
cat > /etc/modprobe.d/kvm.conf << PASTECONFIGURATIONFILE
options kvm_intel nested=1
#options kvm-intel enable_shadow_vmcs=1
options kvm-intel enable_apicv=1
options kvm-intel ept=1
PASTECONFIGURATIONFILE
cat > /etc/systemd/system/cockpit.socket.d/listen.conf << PASTECONFIGURATIONFILE
[Socket]
ListenStream=
ListenStream=127.0.0.1:9090
PASTECONFIGURATIONFILE
# COPY CONFIGURATION FILES

