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
            {
              icon = " ";
              key = "n";
              desc = "New Scratch";
              action.__raw  = ''
                function()
                  Snacks.input.input(
                    { prompt = 'Scratch Name', relative = 'cursor' },
                    function(value)

                      function splitByPeriod(str)
                        local result = {}
                        for part in string.gmatch(str, "([^%.]+)") do
                          table.insert(result, part)
                        end
                        return result
                      end

                      local file = splitByPeriod(value)
                      Snacks.scratch({ name = file[1], ft = file[2] })
                    end)
                end
              '';
            }
            { icon = " "; key = "f"; desc = "Find File";       action  = ":lua Snacks.dashboard.pick('files')";     }
            { icon = " "; key = "c"; desc = "Find Text";       action  = ":lua Snacks.dashboard.pick('live_grep')"; }
            { icon = "󰭤 "; key = "s"; desc = "Find Scratch";    action  = ":lua Snacks.scratch.select()";            }
            { icon = " "; key = "w"; desc = "Recent Files";    action  = ":lua Snacks.dashboard.pick('oldfiles')";  }
            { icon = " "; key = "x"; desc = "Restore Session"; action  = ":lua require('persistence').select()";    }
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
            indent = 16;
            height = 24;
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
