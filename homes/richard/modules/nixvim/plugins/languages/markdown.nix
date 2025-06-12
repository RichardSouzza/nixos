{
  programs.nixvim.plugins = {
    efmls-configs.setup.markdown = {
      formatter = "mdformat";
      linter = "markdownlint";
    };

    # render-markdown.enable = true;
  };
}
