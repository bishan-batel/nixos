{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    catppuccin.enable = false;
  };

  home.packages = with pkgs; [neovide wl-clipboard librsvg imagemagick];
}
