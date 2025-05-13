{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    typescript
    typescript-language-server
  ];

  programs.nixvim.plugins = {
    lsp.servers = {
      eslint.enable = true;

      tailwindcss.enable = true;

      ts_ls = {
        enable = true;

        settings = {
          completions = {
            completeFunctionCalls = true;
          };
        };
      };
    };
  };
}
