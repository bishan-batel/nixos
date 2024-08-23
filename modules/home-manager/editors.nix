{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    # extraConfig = config.lib.mkOutOfStoreSymlink "./";
  };

  home = {
    packages = with pkgs; [
      jetbrains-toolbox
      neovide
      wl-clipboard
    ];
  };
}
