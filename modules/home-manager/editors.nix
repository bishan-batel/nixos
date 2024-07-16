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
  };

  home = {
    packages = with pkgs; [
      jetbrains-toolbox
      neovide
      wl-clipboard
    ];
  };
}
