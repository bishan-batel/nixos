{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    firefox
    flameshot
    gimp
    obsidian
  ];
}
