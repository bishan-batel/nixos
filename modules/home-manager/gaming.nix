{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    tetrio-desktop
    mangohud
    protonup
  ];

  # programs.steam.enable = true;
}
