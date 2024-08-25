{pkgs, ...}: {
  home.packages = with pkgs; [
    rustup
    gnumake
    zig
    lld
    libllvm
    libgcc

    yarn
    nodejs

    dotnet-sdk_8
  ];
}
