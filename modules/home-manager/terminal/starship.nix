{pkgs, ...}: {
  programs = {
    starship = {
      enable = true;
      catppuccin.enable = true;

      settings = {
      };
    };

    carapace.enable = true;
  };
}
