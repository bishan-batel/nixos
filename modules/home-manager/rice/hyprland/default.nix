{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    grim
  ];

  xdg.configFile.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
