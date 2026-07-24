{pkgs, ...}: {
  imports = [
    ./nu.nix
    ./kitty.nix
    ./ghostty.nix
    ./tmux.nix
    ./filemanage.nix
    ./starship.nix
    ./cmdline-tools.nix
    ./zellij.nix
  ];
}
