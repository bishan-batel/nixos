{ pkgs, inputs, ... }:
{
  imports = [ 
    inputs.catppuccin.homeManagerModules.catppuccin 
    ./gtk.nix
    ./eww.nix
    ./rofi.nix
    ./wallpaper.nix
  ];
}


