{
  pkgs,
  config,
  lib,
  ...
}: let
  xborders = pkgs.python3Packages.buildPythonApplication rec {
    pname = "xborders";

    version = "3.4"; # Or a version derived from the project

    src = pkgs.fetchFromGitHub {
      owner = "deter0";
      repo = "xborder";
      rev = "e74ae532b9555c59d195537934fa355b3fea73c5";
      sha256 = "sha256-UKsseNkXest6npPqJKvKL0iBWeK+S7zynrDlyXIOmF4=";
    };

    pythonEnv = pkgs.python3.withPackages (p:
      with p; [
        pygobject3
        pycairo
        requests
      ]);

    dependencies = with pkgs;
      [
        gtk3
        gobject-introspection
        libwnck3
      ]
      ++ [pythonEnv];

    propagatedBuildInputs = with pkgs; [
      gtk3
      gobject-introspection
      libwnck3
    ];

    buildInputs = with pkgs; [
      gtk3
      gobject-introspection
      libwnck3
    ];

    nativeBuildInputs = [
      pkgs.wrapGAppsHook
    ];

    pythonPath = with pkgs;
      [
        gtk3
        gobject-introspection
        libwnck3
        python3Packages.pygobject3
        python3Packages.pycairo
        python3Packages.requests
      ]
      ++ [];

    dontUnpack = true;
    pyproject = false;

    installPhase = ''
      install -Dm755 $src/xborders "$out/bin/xborders"
    '';

    preFixup = ''
      makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
    '';
  };
in {
  home.packages = with pkgs;
    [
      xclip
      picom
    ]
    ++ [pkgs.xborders];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = null;

    extraConfig =
      /*
      bash
      */
      ''         
        include ${config.lib.file.mkOutOfStoreSymlink "/home/bishan_/nixos/modules/home/rice/i3/config"}
        # '';
  };

  xdg.configFile."picom/picom.conf".source = ./picom.conf;
  xdg.configFile."xborders.json".source = ./xborder.json;
}
