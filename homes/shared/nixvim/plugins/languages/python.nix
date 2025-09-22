{
  programs.nixvim.plugins = {
    lsp.servers = {
      ruff.enable = true;
    };

    # efmls-configs = {
    #   setup.python = {
    #     formatter = "ruff";
    #     linter = "ruff";
    #   };
    # };
  };
}
