{pkgs, ...}: {
  services.mako = {
    enable = true;
    borderRadius = 15;
    font = "JetBrainsMono 11";
    defaultTimeout = 5000;
  };
}
