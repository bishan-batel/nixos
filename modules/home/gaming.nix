{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher

    protonup-ng

    tetrio-desktop
    # tetrio-plus
  ];

  # programs.steam.enable = true;

  # Hollow Knight Mod Launcher
}
