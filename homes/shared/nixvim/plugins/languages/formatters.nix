{
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        default_format_opts = {
          lsp_format = "fallback";
        };

        format_on_save = builtins.readFile ./format_on_save.lua;

        format_after_save = {
          lsp_format = "fallback";
        };

        formatters_by_ft = {
          "*" = [ "trim_newlines" "trim_whitespace" ];
          "_" = [ "trim_newlines" "trim_whitespace" ];
          lua = [ "stylua" ];
          sql = [ "sqlfluff" ];
        };

        formatters = {
          sqlfluff = {
            command = "sqlfluff";
            args = [ "fix" "-" ];
            stdin = true;
          };
        };

        log_level = "debug";
        notify_no_formatters = true;
      };
    };
  };

  home.file.".sqlfluff".text = ''
    [sqlfluff]
    dialect = tsql
    encoding = utf-8
    max_line_length = 120

    [sqlfluff:rules:capitalisation.keywords]
    capitalisation_policy = upper

    [sqlfluff:indentation]
    indented_joins = True
    indented_using_on = True
    template_blocks_indent = True
    indent_unit = space
    tab_space_size = 4

    [sqlfluff:rules:layout.commas]
    comma_style = leading

    [sqlfluff:rules:layout.select_targets]
    allow_leading_comma = true
    indent_with_tabs = false
  '';
}
