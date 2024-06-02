{pkgs, ...}: {
  home.packages = with pkgs; [
    ani-cli
    blockbench
    feh
  ];

  programs.mpv = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.imv = {
    enable = true;
    catppuccin.enable = true;
  };
}
