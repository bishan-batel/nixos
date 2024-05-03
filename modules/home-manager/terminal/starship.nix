{pkgs, ...}: {
  programs = {
    starship = {
      enable = true;
    };

    carapace.enable = true;
  };
}
