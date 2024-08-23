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

  qt = {
    enable = true;
    platformTheme = {
      name = "kvantum";
    };
    style = {
      name = "kvantum";
      catppuccin = {
        enable = true;
        apply = true;
      };
    };
  };

  xdg = {
    enable = true;
  };
}
