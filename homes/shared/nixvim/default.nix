{ pkgs, ... }:

{
  imports = [
    ./keymaps
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    nixpkgs.useGlobalPackages = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    # Enable clip and powershell for WSL
    extraConfigLua = ''
      if vim.fn.has('wsl') == 1 then
          vim.g.clipboard = {
              name = 'WslClipboard',
              copy = {
                  ['+'] = 'clip.exe',
                  ['*'] = 'clip.exe',
              },
              paste = {
                  ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                  ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
              },
              cache_enabled = 0,
          }
      end
    '';

    performance = {
      byteCompileLua.enable = true;
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "blink.cmp"
          "nvim-treesitter"
        ];
      };
    };

    opts = {
      expandtab = true;
      relativenumber = true;
      scrolloff = 1000;
      showmode = false;
      shiftwidth = 2;
      tabstop = 4;
      wrap = false;
    };

    extraPackages = with pkgs; [
    # Dependecy    # Required by
      gcc          # TreeSitter
      ripgrep      # Snacks.picker
      wakatime-cli # Wakatime
    ];
  };
}
