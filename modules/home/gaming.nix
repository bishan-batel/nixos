{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    glfw-wayland

    tetrio-desktop
    mangohud
    protonup
  ];

  # programs.steam.enable = true;

  # Hollow Knight Mod Launcher
}
