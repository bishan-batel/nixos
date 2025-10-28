{pkgs, ...}: {
  home.packages = with pkgs; [dconf libsForQt5.qt5.qtwayland catppuccin-gtk];

  gtk = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono";

    theme.name = "Catppuccin-Mocha";

    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
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
