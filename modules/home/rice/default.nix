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
    ./waybar
    ./notifications.nix
    ./spicetify.nix
    ./hyprland
  ];

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";

    pointerCursor = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
    };
  };
}
