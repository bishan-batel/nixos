{ pkgs, ... }:
{
  imports = [
    ./tools.nix
    ./shell.nix
    ./kitty.nix
    ./wallpaper.nix
  ];
}
