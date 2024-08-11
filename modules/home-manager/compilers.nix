{pkgs, ...}: {
  home.packages = with pkgs; [
    rustup
    gnumake
    cmake
    zig
    lld
    libllvm
    libgcc

    yarn
    nodejs

    dotnet-sdk_8

    valgrind

    go
  ];
}
