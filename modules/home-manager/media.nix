{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.feh = {
    enable = true;
  };
}
