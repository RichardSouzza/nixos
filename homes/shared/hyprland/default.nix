{ lib, pkgs, username, ... }:

let
  hyprpaperConfig = "/home/${username}/.config/hypr/hyprpaper.conf";

in
{
  home = {
    packages = with pkgs;  [
      bibata-cursors
      nordzy-cursor-theme
      hyprpicker
    ];
    file = {
      ".config/hypr/hyprland.conf".source = ./hyprland.conf;
    };
  };

  programs = {
    feh.enable = true;
    hyprlock = {
      enable = true;
    };
  };

  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          unlock_cmd = "pkill --signal SIGUSR1 hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 600;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 1800;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
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
