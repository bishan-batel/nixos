{pkgs, ...}: {
  imports = [
    ./nu.nix
    ./kitty.nix
    ./tmux.nix
    ./filemanage.nix
    ./starship.nix
    ./cmdline-tools.nix
  ];
}
