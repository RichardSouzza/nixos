# Richard's NixOS

## Cheatsheet

Rebuild NixOS with Flake:

```sh
nixos-rebuild switch --flake /etc/nixos/#default
```

Update home:

```sh
home-manager switch --flake /etc/nixos/#richard
```

List generations:

```sh
nixos-rebuild list-generations
```

Delete older generations:

```sh
nix-collect-garbage --delete-older-than 5d
```

See Home Manager manual:

```sh
man home-configuration.nix
```

## Setup

### LUKS

1. Disk encryption:

   ```sh
   cryptsetup luksFormat /dev/nvme0n1p2
   cryptsetup luksOpen /dev/nvme0n1p2 crypted
   pvcreate /dev/mapper/crypted
   vgcreate vg /dev/mapper/crypted
   lvcreate -l '100%FREE' -n nixos vg
   ```

2. Formatting:

   ```sh
   mkfs.ext4 -L nixos /dev/vg/nixos
   ```

### Home Manager

1. Add channel:

   ```sh
   nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
   nix-channel --update
   ```

   or

   ```sh
   nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
   nix-channel --update
   ```

2. Install:

   ```sh
   nix-shell '<home-manager>' -A install
   ```

## Post Installation

Connect to a WPA-PSK network using NetworkManager:

```sh
sudo nmcli connection add type wifi \
    ifname <deviceName> \
    con-name <SSID> \
    ssid <SSID> \
    wifi-sec.key-mgmt wpa-psk \
    wifi-sec.psk "<password>"
```

Connect to a WPA-PEAP network using NetworkManager:

```sh
sudo nmcli connection add type wifi \
    ifname <deviceName> \
    con-name <SSID> \
    ssid <SSID> \
    wifi-sec.key-mgmt wpa-eap \
    802-1x.eap peap \
    802-1x.identity "<identity>"
    802-1x.password "<password>" \
    802-1x.phase2-auth mschapv2
```
