{ pkgs, ...}:
{
  programs.hyprland = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
    };
  };
}
