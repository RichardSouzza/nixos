{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    python312Packages.pyflakes
    python312Packages.pylsp-rope
    python312Packages.python-lsp-server
  ];

  programs.nixvim.plugins = {
    lsp.servers.pylsp = {
      enable = true;
      autostart = true;

      settings = {
        pylsp = {
          configurationSources = [ "pylint" ];
          plugins = {
            pyflakes.enabled = true;
            rope_autoimport.enabled = true;
          };
        };
      }; 
    };
  };
}
