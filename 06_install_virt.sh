#!/bin/bash

apt update
apt install -y virt-manager bridge-utils
systemctl --no-pager start libvirtd
systemctl --no-pager enable libvirtd
systemctl --no-pager status libvirtd

modprobe -r kvm_intel
modprobe kvm_intel nested=1

# COPY CONFIGURATION FILES
mkdir -p /etc
mkdir -p /etc/modprobe.d
cat > /etc/modprobe.d/kvm.conf << PASTECONFIGURATIONFILE
options kvm_intel nested=1
#options kvm-intel enable_shadow_vmcs=1
options kvm-intel enable_apicv=1
options kvm-intel ept=1
PASTECONFIGURATIONFILE
# COPY CONFIGURATION FILES

# TODO: enable iommu

