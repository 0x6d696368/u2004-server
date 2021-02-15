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

## SSH

**TODO:**

- Ratelmiting
- Scripts `/usr/local/sbin/`


## Xpra

- Server
	- List sessions: `xpra list`
	- List sessions for all users: `ls /home/. | while read u; do echo "${u} ###########"; su ${u} -c "xpra list"; done`
	- Stop session `:100`: `xpra stop :100` 
- Client
	- Start session: `xpra --ssh=ssh start ssh://1.2.3.4/10 --dpi 96`
	- Attach to existing session: `xpra --ssh=ssh attach ssh://1.2.3.4/10 --dpi 96`
	- Stop session: `xpra --ssh=ssh stop ssh://1.2.3.4/10`

**TODO:**

- Application menu isn't transmitted/show in Xpra system tray

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

## TODO

- Port everything from <https://github.com/0x6d696368/el8-server>
