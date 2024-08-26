{pkgs, ...}: {
  home.file.".Xresources".text =
    /*
    sh
    */
    ''
      Xft.dpi: 160
    '';

  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_SCALE_FACTOR,2"
      "GDK_SCALE,2"
      "QT_AUTO_SCREEN_SCALE_FACTOR,2"
      "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1:/dev/dri/card2"
    ];

    input = {
      touchpad = {
        clickfinger_behavior = 1;
        disable_while_typing = true;
        tap-to-click = true;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 4;
      workspace_swipe_min_fingers = 4;
      workspace_swipe_distance = 400;
      workspace_swipe_touch = true;
    };

    bind = [
      "SUPER, G, exec, sh ${pkgs.writeShellScriptBin "game_mode.sh" ''
        #!/usr/bin/env sh
        HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
        if [ "$HYPRGAMEMODE" = 1 ] ; then
          hyprctl --batch "\
          keyword animations:enabled 0;\
          keyword decoration:drop_shadow 0;\
          keyword decoration:blur:enabled 0;\
          keyword general:gaps_in 0;\
          keyword general:gaps_out 0;\
          keyword general:border_size 1;\
          keyword decoration:rounding 0"
          pkill waybar
          exit
        fi
        hyprctl reload
        waybar
      ''}/bin/game_mode.sh"
    ];

    xwayland = {
      force_zero_scaling = true;
      use_nearest_neighbor = true;
    };
  };
}
