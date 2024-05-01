{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustup
    gcc
    gnumake
    cmake
    zig
  ];
}
