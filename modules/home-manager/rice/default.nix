{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ./gtk.nix
    ./rofi.nix
    ./wallpaper.nix
    ./notifications.nix
    ./eww
    ./hyprland
  ];
}
