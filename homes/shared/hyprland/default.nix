{ inputs, lib, pkgs, username, ... }:

let
  hyprpaperConfig = "/home/${username}/.config/hypr/hyprpaper.conf";
  hyprspace = inputs.Hyprspace.packages.${pkgs.system}.Hyprspace;

in
{
  home = {
    packages = with pkgs;  [
      bibata-cursors
      hyprpicker
      nordzy-cursor-theme
    ];
    file = {
      ".config/hypr/hyprland.conf".source = ./hyprland.conf;
    };
  };

  programs = {
    feh.enable = true;
  };

  wayland.windowManager.hyprland = {
    plugins = [
      hyprspace
    ];
  };
}
// (if !builtins.pathExists hyprpaperConfig then
{
  home.activation.mkHyprpaperConfig =
    lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      cat <<-EOF > ~/.config/hypr/hyprpaper.conf
      wallpaper {
          monitor =
          path = ~/imgs/wallpapers/
      }
      splash = false;
      EOF
    '';
} else {})
