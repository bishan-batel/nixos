{pkgs, ...}: {
  home.packages = with pkgs; [
    rustup
    gnumake
    cmake
    zig
    lld

    yarn
    nodejs

    dotnet-sdk
  ];
}
