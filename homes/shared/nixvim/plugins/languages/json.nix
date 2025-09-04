{
  programs.nixvim.plugins = {
    lsp.servers = {
      jsonls = {
        enable = true;
        settings = {
          json = {
            format.enable = true;
            validate.enable = true;
          };
        };
      };
    };
  };
}
