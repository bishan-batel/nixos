{pkgs, ...}: {
  services.mako = {
    enable = true;
    catppuccin.enable = true;
    borderRadius = 10;
    font = "JetBrainsMono 11";
    defaultTimeout = 5000;
  };
}
