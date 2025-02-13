# Richard's NixOS

## Cheatsheet

Rebuild NixOS with Flake:

```sh
nixos-rebuild switch --flake /etc/nixos/#default
```

Update home:

```sh
home-manager switch
```

List generations:

```sh
nixos-rebuild list-generations
```

Delete older generations:

```sh
nix-collect-garbage --delete-older-than 1d
```
