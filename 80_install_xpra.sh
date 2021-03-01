#!/bin/bash

#FIXME: ubuntu packages don't work
#apt -y install xpra
#wget -q https://xpra.org/gpg.asc -O- | apt-key add -
cat | apt-key add - <<EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=RfsN
-----END PGP PUBLIC KEY BLOCK-----
EOF
wget -q https://xpra.org/repos/focal/xpra.list -O /etc/apt/sources.list.d/xpra.list
apt update
apt install -y xpra python3-pip
pip3 install pyinotify

# COPY CONFIGURATION FILES
mkdir -p /etc
mkdir -p /etc/xpra
cat > /etc/xpra/xpra.conf << PASTECONFIGURATIONFILE
#
# This is the default configuration file for Xpra
#
# You can provide default values for most command line
# options here.
#
# The configuration files in the conf.d directory will
# be parsed first.
#
# Each user may also define its own options in the file
# ~/.xpra/xpra.conf which will take precedence over this file.
#
# Most options can also be overriden on the xpra command line.
# See "xpra -h" or the man page for details.
#
# Syntax:
# - Options which can be turned on or off will accept
#   the following values: 1, 0, true, false, yes, no
# - Options which can accept multiple values
#   may just be specified multiple times.
# - You may break a long line into multiple lines
#   by ending each line with a backslash '\\'.
printing = no
speaker = off
webcam = no
pixel-depth = 16
mdns = no
env = XDG_MENU_PREFIX=gnome-
PASTECONFIGURATIONFILE
# COPY CONFIGURATION FILES

systemctl --no-pager stop xpra
systemctl --no-pager disable xpra

