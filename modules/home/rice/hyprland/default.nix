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

  # services.hypridle.enable = true;
  home.file."${config.xdg.configHome}/hypr/hypridle.conf".text =
    /*
    hyprlang
    */
    ''
      general {
        lock_cmd = notify-send "fuck im out of the system"          # dbus/sysd lock command (loginctl lock-session)
        unlock_cmd = notify-send "i'm in"      # same as above, but unlock
        before_sleep_cmd = notify-send "eep"    # command ran before sleep
        after_sleep_cmd = notify-send "mondays"  # command ran after sleep
        ignore_dbus_inhibit = false             # whether to ignore dbus-sent idle-inhibit requests (used by e.g. firefox or steam)
        ignore_systemd_inhibit = false          # whether to ignore systemd-in# hibit --what=idle inhibitors
      }

      listener {
        timeout = 500                            # in seconds
        # on-timeout = notify-send "You are idle!" # command to run when timeout has passed
        # on-resume = notify-send "Welcome back!"  # command to run when activity is detected after timeout has fired.
      }
    '';

  programs.hyprlock = {
    enable = true;
    settings = {
    };
  };
}
