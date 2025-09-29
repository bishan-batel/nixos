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
    catppuccin.enable = true;
  };
}
