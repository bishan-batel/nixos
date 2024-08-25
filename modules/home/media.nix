{pkgs, ...}: {
  home.packages = with pkgs; [
    ani-cli
    blockbench
    feh
  ];

  programs.mpv = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
    };
  };

  programs.imv = {
    enable = true;
    catppuccin.enable = true;
  };
}
