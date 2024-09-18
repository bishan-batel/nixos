{pkgs, ...}: {
  home.packages = with pkgs; [
    # rustup
    gnumake
    lld
    libllvm
    libgcc

    python3

    clang
    yarn
    nodejs

    dotnet-sdk_8
  ];
}
