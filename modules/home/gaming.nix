{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    tetrio-desktop
    mangohud
    protonup
    scarab
  ];

  # programs.steam.enable = true;

  # Hollow Knight Mod Launcher
}
