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
    # ./eww
    ./waybar
    ./hyprland
    # ./ags
    # ./shortcuts.nix
  ];

  catppuccin.flavor = "mocha";

  qt = {
    enable = true;
  };
}
