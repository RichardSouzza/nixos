# Richard's NixOS

## Cheatsheet

Rebuild NixOS with Flake:

```sh
nixos-rebuild switch --flake /etc/nixos/#hostname
```

Update home:

```sh
home-manager switch --flake /etc/nixos/#user@hostname
```

List generations:

```sh
nixos-rebuild list-generations
```

Updating:

```sh
nix-channel --update
nix flake update <input> --flake /etc/nixos
sudo nixos-rebuild switch --flake /etc/nixos/#hostname --upgrade-all
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
    802-1x.identity "<identity>" \
    802-1x.password "<password>" \
    802-1x.phase2-auth mschapv2
```

## Cleanup

Remove old generations:

```sh
sudo nix-collect-garbage -d # root
nix-collect-garbage -d      # user
```

Optimise Nix store:

```sh
sudo nix-store --optimise
```

All in one:

```sh
sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nix-store --gc && sudo nix-store --optimise
```

## Rollback

Rollback system:

```sh
nixos-rebuild list-generations
sudo nix-env --switch-generation <generation_number>
```

Rollback home:

```sh
home-manager generations
/nix/store/...-home-manager-generation/activate
```

Rollback channels:

```sh
sudo nix-channel --list-generations
sudo nix-channel --rollback <generation_number>
```

## Troubleshooting

`Pre-switch check 'switchInhibitors' failed`

This happens because the new build is replacing critical system components
that could cause problems if swapped while the system is running.

To apply the new build, enable its activation for the next boot and
then restart.

```sh
nixos-rebuild boot --flake /etc/nixos/#magus
reboot
```
