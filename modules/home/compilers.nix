{pkgs, ...}: {
  home.packages = with pkgs; [
    # rustup
    gnumake
    zig
    lld
    libllvm
    libgcc

    clang

    yarn
    nodejs

    dotnet-sdk_8
  ];
}
