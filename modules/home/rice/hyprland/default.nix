{
  pkgs,
  inputs,
  config,
  ...
}: let
  hypr-pkgs = inputs.hyprland-plugins.packages.${pkgs.system};
in {
  home.packages = with pkgs; [
    sway-contrib.grimshot
    hyprshade
    inputs.hyprland-qtutils.packages."${pkgs.system}".default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    # portalPackage = null;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;
    systemd = {
      enable = true;
    };

    settings = {
      source = ["./hypr.conf"];
      exec-once = ["startup.nu"];
    };

    plugins = [
      hypr-pkgs.hyprtrails
    ];
  };

  # home.file."${config.xdg.configHome}/hypr/hypr.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/bishan_/nixos/hyprland.conf";
  xdg.configFile."hypr/hypr.conf".source = ./hyprland.conf;
  # home.file."${config.xdg.configHome}/hypr/hypridle.conf".source = ./hypridle.conf;

  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;
  services.hypridle.enable = true;

  programs.hyprlock = {
    enable = true;
    settings = {
    };
  };
}
