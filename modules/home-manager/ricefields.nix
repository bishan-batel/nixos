{ pkgs, inputs, ... }:
{
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  home.packages = with pkgs; [
    rofi-wayland
  ];

  gtk = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono";

    catppuccin = { enable = true; };
  };

  xdg = {
    enable = true;
  };

  programs.rofi.catppuccin.enable = true;
}
