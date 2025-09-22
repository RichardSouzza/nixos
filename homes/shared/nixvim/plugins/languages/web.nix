{
  programs.nixvim.plugins = {
    lsp.servers = {
      cssls.enable = true;

      html.enable = true;

      # jsonls = {
      #   enable = true;
      #   settings = {
      #     json = {
      #       format.enable = true;
      #       validate.enable = true;
      #     };
      #   };
      # };

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
