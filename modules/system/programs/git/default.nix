{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      git
    ];

    etc = {
      "gitconfig".source = ./gitconfig;
    };
  };
}
