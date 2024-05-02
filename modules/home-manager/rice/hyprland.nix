{pkgs, ...}: {
  home.packages = with pkgs; [
    flameshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    xwayland.enable = true;

    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
    };
  };
}
