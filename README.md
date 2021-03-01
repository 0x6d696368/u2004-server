**WORK IN PROGRESS. USE WITH CAUTION!**

# UBUNTU 20.04 LTS SERVER SCRIPTS

Bootstrap a Ubuntu 20.04 LTS system starting from scratch.

Tested on/with:

- Intel(R) Core(TM) i5-2400 (bare-metal)

## Nomenclature 

- `1.2.3.4`: IP of server you install this stuff on

## Base install

Just use defaults. Do **not** select any additional Snap repositories.

**FIXME:** Install seems to hang. "Cancel update and reboot" seems to resolve it.

**TODO:** Find optimal setup settings.

## `01_install_base.sh` (auto updates + other stuff)

1. Run `01_install_base.sh`
2. **Check for correct netowkr configuration in `/etc/netplan/01-netcfg.yaml`**

### TODO

- Automatic reboot 

## SSH

**TODO:**

- Ratelmiting
- Scripts `/usr/local/sbin/`


## Xpra

### Server

- List sessions:

```
xpra list
```

- List sessions for all users:

```
ls /home/. | while read u; do echo "${u} ###########"; su ${u} -c "xpra list"; done
```

- Stop session `:100`:

```
su user -c "xpra stop :100"
```

- Start HTML5 session (connect browser to 127.0.0.1:10000):

```
xpra start --bind-tcp=127.0.0.1:10000,auth=pam --env=XDG_MENU_PREFIX=gnome-
```

### Client

- Start session:

```
xpra --ssh=ssh start ssh://host/10 --dpi 96 --env=XDG_MENU_PREFIX=gnome-
```

- Attach to existing session:

```
xpra --ssh=ssh attach ssh://host/10 --dpi 96 --env=XDG_MENU_PREFIX=gnome-
```

- Stop session:

```
xpra --ssh=ssh stop ssh://host/10
```

### TODO

- Must start `xpra` with exported `XDG_MENU_PREFIX=gnome-` for start menu to work

## LibVirt

- Check virtualization features:

```
LC_ALL=C lscpu | grep Virtualization
```

- **TODO** maybe we need `sudo adduser ubuntu kvm`

### Virtual networks

```
virsh net-list
virsh net-edit <network>
virsh net-destroy <network>
virsh net-start <network>
```

### CDROM

- List:

```
virsh domblklist <vm_ ame>
```

- Eject:

```
virsh change-media <vm name> <device> --eject
```

- Insert:

```
change-media <vm name> <device> <iso/qcow2 path> --insert
```

## TODO

- Port everything from <https://github.com/0x6d696368/el8-server>

