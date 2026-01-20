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
      name = "qtct";
    };
    style = {
      name = "kvantum";
    };
  };

  catppuccin.qt5ct = {
    enable = true;
  };

  xdg = {
    enable = true;
  };
}
