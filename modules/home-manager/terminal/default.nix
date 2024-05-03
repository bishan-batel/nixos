{pkgs, ...}: {
  imports = [
    ./nu.nix
    ./kitty.nix
    ./filemanage.nix
    ./starship.nix
  ];
}
