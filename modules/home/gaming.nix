{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher

    mangohud
    protonup

    tetrio-desktop
    # tetrio-plus
  ];

  # programs.steam.enable = true;

  # Hollow Knight Mod Launcher
}
