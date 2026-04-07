{ pkgs, ... }: {
  programs.zellij = {
    enable = true;

    settings = {

    };
  };

  catppuccin.zellij.enable = true;
}
