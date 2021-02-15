#!/bin/bash
./00_generate_install.sh 01_install_base.src     base     > 01_install_base.sh;     chmod u+x 01_install_base.sh
./00_generate_install.sh 02_install_ssh.src      ssh      > 02_install_ssh.sh;      chmod u+x 02_install_ssh.sh
./00_generate_install.sh 06_install_cockpit.src cockpit   > 06_install_cockpit.sh;  chmod u+x 06_install_cockpit.sh

