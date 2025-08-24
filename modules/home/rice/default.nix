{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./gtk.nix
    ./rofi.nix
    ./wallpaper.nix
    ./waybar
    ./notifications.nix
    ./spicetify.nix
    ./hyprland
    ./i3
  ];

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";

    cursors.enable = true;
    yazi.enable = true;
    bat.enable = true;
    fzf.enable = true;
    kitty.enable = true;
    starship.enable = true;
    gh-dash.enable = true;
    delta.enable = true;
    # gtk.enable = true;
    # gtk.icon.enable = true;
    zathura.enable = true;
    btop.enable = true;

    mpv.enable = true;
    imv.enable = true;
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
