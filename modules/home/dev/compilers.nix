{pkgs, ...}: {
  home.packages = with pkgs; [
    # rustup
    gnumake
    lld
    # libllvm
    # libgcc

    gradle

    luarocks
    lua

    python3

    clang
    yarn
    nodejs

    dotnet-sdk_8

    cppreference-doc
  ];
}
