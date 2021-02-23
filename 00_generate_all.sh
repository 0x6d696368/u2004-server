#!/bin/bash
./00_generate_install.sh 01_install_base.src     base     > 01_install_base.sh;     chmod u+x 01_install_base.sh
./00_generate_install.sh 02_install_ssh.src      ssh      > 02_install_ssh.sh;      chmod u+x 02_install_ssh.sh
./00_generate_install.sh 06_install_virt.src     virt     > 06_install_virt.sh;     chmod u+x 06_install_virt.sh
./00_generate_install.sh 80_install_xpra.src     xpra     > 80_install_xpra.sh;     chmod u+x 80_install_xpra.sh

