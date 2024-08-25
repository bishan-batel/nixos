{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    sway-contrib.grimshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    xwayland.enable = true;
    systemd = {
      enable = true;
    };

    settings = {
      source = ["./hypr.conf"];
      exec-once = ["startup.nu"];
    };

    plugins = [];
  };

  # home.file."${config.xdg.configHome}/hypr/hypr.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/bishan_/nixos/hyprland.conf";
  home.file."${config.xdg.configHome}/hypr/hypr.conf".source = ./hyprland.conf;
}
