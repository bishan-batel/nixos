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
      monitor = [
        "DP-1, highrr, auto, auto"
        "HDMI-A-1, preferred,auto,auto"
      ];
    };
  };
}
