{
  programs.nixvim = {
    globals = {
      OmniSharp_server_use_mono = 1;
    };

    plugins = {
      lsp.servers = {
        csharp_ls.enable = false;

        cssls.enable = true;

        gopls.enable = true;

        html.enable = true;

        jsonls.enable = true;

        nixd = {
          enable = true;
          cmd = [ "nixd" "--inlay-hints=false" "--semantic-tokens" ];
        };

        omnisharp = {
          enable = false;
          settings = {
            enable_import_completion = true;
            enable_roslyn_analyzers = true;
            organize_imports_on_format = true;
          };
        };

        ruff.enable = true;

        tailwindcss.enable = true;

        ts_ls = {
          enable = true;
          settings = {
            completions = {
              completeFunctionCalls = true;
            };
            javascript = {
              format.enable = false;
            };
          };
        };
      };
    };
  };
}
