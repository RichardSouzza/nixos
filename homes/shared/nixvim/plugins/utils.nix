{ lib, pkgs, ... }:

with lib;

let
  inherit
    (pkgs) fetchFromGitHub;
  inherit
    (pkgs.vimUtils) buildVimPlugin;

  isWakatimeInstalled = pkgs.wakatime-cli != null;

in
{
  programs.nixvim = {
    plugins = {
      snacks = {
        settings = {
          notifier.enabled = true;
          picker.enabled = true;
          quickfile.enabled = true;
        };
      };

      lazygit.enable = true;
      wakatime.enable = true;
      which-key.enable = true;
    };

    extraConfigLua = ''
      local fh = require('floating-help')

      fh.setup({
        width = 120,
        height = 0.9,
        position = 'C',
        border = 'rounded',
        onload = function(query_type) end,
      })

      vim.keymap.set('n', '<F1>', fh.toggle)
      vim.keymap.set('n', '<F2>', function()
        fh.open('t=cppman', vim.fn.expand('<cword>'))
      end)
      vim.keymap.set('n', '<F3>', function()
        fh.open('t=man', vim.fn.expand('<cword>'))
      end)

      local function cmd_abbrev(abbrev, expansion)
        local cmd = 'cabbr ' .. abbrev .. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "' .. expansion .. '" : "' .. abbrev .. '")<CR>'
        vim.cmd(cmd)
      end

      cmd_abbrev('h',         'FloatingHelp')
      cmd_abbrev('help',      'FloatingHelp')
      cmd_abbrev('helpc',     'FloatingHelpClose')
      cmd_abbrev('helpclose', 'FloatingHelpClose')
    '';

    extraPlugins = [
      (buildVimPlugin {
        name = "floating-help";
        src = fetchFromGitHub {
          owner = "Tyler-Barham";
          repo = "floating-help.nvim";
          rev = "main";
          hash = "sha256-zPcd88Zy3piP622NP9etnTspKABLbdmOSyui+wcGNuI=";
        };
      })
    ];

    keymaps = [
      {
        action = "<CMD>lua Snacks.picker.lines({ layout = { preset = 'select' } })<CR>";
        key = "/";
        mode = "n";
        options = {
          desc = "Find line";
          silent = true;
        };
      }
      {
        action = "<CMD>lua Snacks.picker.grep({ regex = false })<CR>";
        key = "fc";
        mode = "n";
        options = {
          desc = "Find code";
          silent = true;
        };
      }
      {
        action = "<CMD>lua Snacks.picker.files({ hidden = true })<CR>";
        key = "ff";
        mode = "n";
        options = {
          desc = "Find files";
          silent = true;
        };
      }
      {
        action = "<CMD>LazyGit<CR>";
        key = "gg";
        mode = "n";
        options = {
          desc = "Open Lazygit";
        };
      }
    ];
  };

  home.file.".wakatime/wakatime-cli".source =
    (mkIf isWakatimeInstalled "${pkgs.wakatime}/bin/wakatime-cli");
}
