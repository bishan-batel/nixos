{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    [
      prismlauncher

      protonup-ng

      # tetrio-plus
    ]
    ++ [
      (
        let
          version = "10"; # Ensure this matches your tetrio-plus artifact
          tetrioPlusVersion = "0.28.2";

          # Download and extract the zip archive containing the app.asar file
          tetrio-plus-src = pkgs.fetchzip {
            url = "https://gitlab.com/UniQMG/tetrio-plus/-/releases/electron-${tetrioPlusVersion}-tetrio-v${version}/downloads/tetrio-plus_v${tetrioPlusVersion}_for_desktop_v${version}.asar.zip";
            hash = "sha256-BxZfdhGzSKc1zM/oXElS/Lq7GeTbd5//EBG+8yNezr4=";
          };

        in
        pkgs.tetrio-desktop.overrideAttrs (oldAttrs: {
          pname = "tetrio-plus-desktop";

          # We append to the existing installation phase to hot-swap the internal ASAR
          postInstall = (oldAttrs.postInstall or "") + ''
            # Remove the official app.asar package
            rm -rf $out/share/tetrio-desktop/resources/app.asar

            # Copy the modified app.asar extracted from the fetchzip derivation
            mkdir -p $out/share/TETR.IO/resources/
            cp ${tetrio-plus-src}/app.asar $out/share/TETR.IO/app.asar
            cp ${tetrio-plus-src}/app.asar $out/share/TETR.IO/resources/app.asar
          '';
        })
      )
    ];

  # programs.steam.enable = true;

  # Hollow Knight Mod Launcher
}
