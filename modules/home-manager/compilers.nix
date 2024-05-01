{pkgs, ...}: {
  home.packages = with pkgs; [
    rustup
    gnumake
    cmake
    zig
  ];
}
