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
nix-collect-garbage --delete-older-than 1d
```

See Home Manager manual
```
man home-configuration.nix
```
