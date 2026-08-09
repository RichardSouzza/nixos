{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dotnet-sdk_10
    jetbrains.rider
    jetbrains-toolbox
  ];

  home.file.".config/JetBrains/Rider2026.1/rider64.vmoptions".text = ''
    # custom JetBrains Rider VM options (expand/override 'bin/rider64.vmoptions')

    -Dawt.toolkit.name=WLToolkit
  '';

  home = {
    sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_10_0-bin}/share/dotnet";
    };
    sessionPath = [
      "$HOME/.dotnet/tools"
    ];
  };
}
