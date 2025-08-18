{pkgs, ...}: {
  home.packages = with pkgs; [
    ani-cli
    blockbench
    feh
  ];

  programs = {
    mpv.enable = true;
    imv.enable = true;
  };
}
