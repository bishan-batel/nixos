{
  pkgs,
  config,
  inputs,
  ...
}: let
  hypr-pkgs = inputs.hyprland-plugins.packages.${pkgs.system};
in {
  home.packages = with pkgs; [
    sway-contrib.grimshot
    hyprshade
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

    plugins = [
      # hypr-pkgs.hyprtrails
    ];
  };

  # home.file."${config.xdg.configHome}/hypr/hypr.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/bishan_/nixos/hyprland.conf";
  home.file."${config.xdg.configHome}/hypr/hypr.conf".source = ./hyprland.conf;

  services.hypridle.enable = true;

  home.file."${config.xdg.configHome}/hypr/hypridle.conf".source = ./hypridle.conf;

  programs.hyprlock = {
    enable = true;
    settings = {
    };
  };
}
