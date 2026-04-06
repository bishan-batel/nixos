{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
  };

  catppuccin.zellij.enable = true;
}
