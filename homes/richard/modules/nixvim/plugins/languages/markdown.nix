{
  programs.nixvim.plugins = {
    efmls-configs = {
      setup.markdown = {
        formatter = "mdformat";
        linter = "markdownlint";
      };
    };

    markdown-preview.enable = true;
  };
}
