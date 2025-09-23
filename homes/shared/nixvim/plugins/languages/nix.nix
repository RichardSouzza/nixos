{
  programs.nixvim.plugins = {
    lsp.servers = {
      nixd = {
        enable = true;
        cmd = [
          "nixd"
          "--inlay-hints=false"
          "--semantic-tokens"
        ];
      };
    };
  };
}
