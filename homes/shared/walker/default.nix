{
  services = {
    elephant = {
      enable = true;
      settings = {
        providers = {
          default = [
            "desktopapplications"
            "runner"
          ];
        };
      };
    };
    walker = {
      enable = true;
      systemd.enable = true;
    };
  };
}
