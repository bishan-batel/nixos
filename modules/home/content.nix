{pkgs, ...}: {
  home.packages = with pkgs; [
    qjackctl
    easyeffects
  ];
}
