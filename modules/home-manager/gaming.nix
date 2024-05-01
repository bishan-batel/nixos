{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    tetrio-desktop
  ];

  # programs.steam.enable = true;
}
