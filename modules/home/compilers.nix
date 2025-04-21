{pkgs, ...}: {
  home.packages = with pkgs; [
    # rustup
    gnumake
    lld
    libllvm
    libgcc

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

  xdg.desktopEntries.cppreference = {
    name = "CPP Reference";
    exec = "${pkgs.firefox} ${pkgs.cppreference-doc}";
    terminal = false;
    type = "Application";
    categories = ["System"];
    mimeType = ["x-scheme-handler/org-protocol"];
  };
}
