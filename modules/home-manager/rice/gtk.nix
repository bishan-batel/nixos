{pkgs, ...}: {
  home.packages = [pkgs.dconf];
  gtk = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono";

    catppuccin = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
      icon = {
        enable = true;
        # accent = "mauve";
        # flavor = "mocha";
        # size = "standard";
      };
    };
  };

  xdg = {
    enable = true;
  };
}
