{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    grim
  ];

  home.file."~/.config/hypr/hyprland.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink ./hyprland.conf;
  };
}
