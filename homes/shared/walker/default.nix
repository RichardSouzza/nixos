{ inputs, ... }:

{
  imports = [ inputs.walker.homeManagerModules.default ];

  services.walker = {
    enable = true;
    systemd.enable = true;
  };
}
