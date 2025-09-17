{ inputs, lib, pkgs, username, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
  ];

  programs.zen-browser = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };


    profiles."default" = {
      containers = {
        Personal = {
          color = "turquoise";
          icon = "vacation";
          id = 1;
        };
        Work = {
          color = "blue";
          icon = "briefcase";
          id = 2;
        };
      };

      extensions = {
        force = true;
        packages = with pkgs.firefoxAddons; [
          darkreader
          mouse-tooltip-translator-pdf
          qr-code-address-bar
          ublock-origin
        ];
      };

      search.default = "ddg";

      settings = {
        "browser.translations.automaticallyPopup" = false;
        "extensions.autoDisableScopes" = 0;
        "extensions.update.enabled" = false;
        "layout.css.zoom" = "1.1";
        "layout.spellcheckDefault" = 0;
        "middlemouse.paste" = false;
        "zen.theme.accent-color" = "#424A62";
        "zen.theme.color-prefs.use-workspace-colors" = true;
        "zen.view.use-single-toolbar" = true;
        "zen.welcome-screen.seen" = true;
      };
    };
  };

  home.activation.cleanupZen = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f /home/${username}/.zen/default/search.json.mozlz4
  '';

  home.file.".zen/default/zen-keyboard-shortcuts.json".source = ./zen-keyboard-shortcuts.json;
}
