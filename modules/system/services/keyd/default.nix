{
  # Key Remapping Deamon
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "esc";
            kpdelete = "delete";
            leftalt = "layer(alt)";
            kpenter = "enter";
            kp1 = "end";
            kp2 = "down";
            kp3 = "pagedown";
            kp4 = "left";
            kp5 = "down";
            kp6 = "right";
            kp7 = "home";
            kp8 = "up";
            kp9 = "pageup";
          };
          alt = {
            esc = "capslock";
          };
        };
      };
    };
  };
}
