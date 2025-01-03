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
      enable = false;
      accent = "mauve";
      flavor = "mocha";
    };
  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["JetBrainsMono"];
        sansSerif = ["JetBrainsMono"];
        serif = ["JetBrainsMono"];
      };
    };
  };
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.agave
  ];
}
