{ pkgs, ... }:

{
  programs.nixvim= {
    plugins = {
      persistence = {
        enable = true;
        luaConfig.post = ''
          -- https://github.com/folke/persistence.nvim/issues/27#issuecomment-3144573536
          local group = vim.api.nvim_create_augroup('PersistenceSession', { clear = true })
          vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "PersistenceSavePre",
            callback = function() vim.cmd("Neotree close") end
          })
        '';
      };

      snacks.settings.dashboard = {
        enable = true;
        pane_gap = 8;

        preset = {
          keys = [
            # TODO: Input make scratch
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action.__raw  = ''
                function()
                  Snacks.input.input(
                    { prompt = 'Scratch Name', relative = 'cursor' },
                    function(value)
                      Snacks.scratch({ name = value })
                    end)
                end
              '';
            }
            { icon = " "; key = "f"; desc = "Find File";       action  = ":lua Snacks.dashboard.pick('files')";     }
            { icon = " "; key = "g"; desc = "Find Text";       action  = ":lua Snacks.dashboard.pick('live_grep')"; }
            { icon = " "; key = "r"; desc = "Recent Files";    action  = ":lua Snacks.dashboard.pick('oldfiles')";  }
            { icon = " "; key = "s"; desc = "Restore Session"; action  = ":lua require('persistence').select()";    }
            { icon = " "; key = "b"; desc = "Browse Repo";     action  = ":lua Snacks.gitbrowse()";                 }
            { icon = " "; key = "q"; desc = "Quit";            action  = ":qa";                                     }
          ];
        };

        sections = [
          { section = "header"; indent = 2; }
          { section = "keys"; gap = 1; padding = 1; }
          {
            icon = " ";
            title = "Projects";
            section = "projects";
            indent = 2;
            padding = 1;
          }
          { section = "terminal";
            cmd = "krabby name blastoise --no-title; sleep .1";
            pane = 2;
            indent = 14;
            height = 22;
          }
          {
            icon = " ";
            title = "Recent Files";
            section = "recent_files";
            indent = 2;
            padding = 1;
            pane = 2;
          }
          { key = "/"; action  = ":lua Snacks.dashboard.pick('files')"; }
        ];
      };
    };

    extraPackages = with pkgs; [
      krabby # Poke sprites
    ];
  };
}
