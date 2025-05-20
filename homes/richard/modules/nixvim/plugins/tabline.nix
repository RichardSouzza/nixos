{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;

      settings.options = {
        offsets = [
        {
            filetype = "NvimTree";
            text = "File Explorer";
            text_align = "center";
            separator = true;
        }];
      };
    };
  };
}
