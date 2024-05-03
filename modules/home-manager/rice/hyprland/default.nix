{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    grim
  ];

  home.file."~/.config/hypr/hyprland.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink nixos/modules/home-manager/rice/hyprland/hyprland.conf;
  };
}
