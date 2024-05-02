{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    gimp
    obsidian
  ];
}
