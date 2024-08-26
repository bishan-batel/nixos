{pkgs, ...}: {
  home.file.".Xresources".text =
    /*
    sh
    */
    ''
      Xft.dpi: 180
    '';

  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_SCALE_FACTOR, 2"
      "GDK_SCALE, 2"
      "QT_AUTO_SCREEN_SCALE_FACTOR, 2"
    ];

    xwayland = {
      force_zero_scaling = true;
      use_nearest_neighbor = true;
    };
  };
}
