{
  pkgs,
  inputs,
  spicetify-nix,
  ...
}: {
  # home.packages = with pkgs; [spotify];

  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    spotifyPackage = pkgs.spotify;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      keyboardShortcut
      popupLyrics
      playingSource
      randomBadToTheBoneRiff
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
