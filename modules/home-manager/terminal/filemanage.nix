{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      show_hidden = true;
    };

    catppuccin.enable = true;
  };
}
