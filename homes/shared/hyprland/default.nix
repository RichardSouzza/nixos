{ lib, username, ... }:

let
  hyprpaperConfig = "/home/${username}/.config/hypr/hyprpaper.conf";

in
{
  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
  };
}
// (if !builtins.pathExists hyprpaperConfig then
{
  home.activation.mkHyprpaperConfig =
    lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      cat <<-EOF > ~/.config/hypr/hyprpaper.conf
      preload=~/imgs/wallpapers/
      wallpaper=eDP-1, ~/imgs/wallpapers/
      EOF
    '';
} else {})
