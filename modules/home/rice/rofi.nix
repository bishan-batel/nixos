{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    rofi-wayland
  ];

  programs.rofi.catppuccin.enable = true;
}
