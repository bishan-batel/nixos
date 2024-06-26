{
  pkgs,
  config,
  ...
}: {
  #home.packages = with pkgs; [
  #];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

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
  home.file.".config/hypr/hypr.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland.conf;
}
