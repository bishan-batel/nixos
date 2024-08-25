{
  pkgs,
  inputs,
  ...
}: {
  # home.packages = with pkgs; [
  #   rofi-wayland
  # ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    catppuccin.enable = true;
  };
}
