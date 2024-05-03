{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ./gtk.nix
    ./eww
    ./rofi.nix
    # ./hyprland.nix
    ./wallpaper.nix
    ./notifications.nix
  ];
}
