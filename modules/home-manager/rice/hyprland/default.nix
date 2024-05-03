{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    flameshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    xwayland.enable = true;

    systemd.enable = true;

    settings = {
      source = ["./hypr.conf"];
    };
  };

  home.file = {
    ".config/hyprland/hypr.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink ./hypr.conf;
    };
  };
}
