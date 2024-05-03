{pkgs, ...}: {
  programs = {
    starship = {
      enable = true;
      catppuccin.enable = true;
    };

    carapace.enable = true;
  };
}
