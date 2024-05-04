{
  pkgs,
  config,
  inputs,
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

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprtrails
    ];
  };
  home.file.".config/hypr/hypr.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland.conf;
}
