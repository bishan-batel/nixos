{
  pkgs,
  lib,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["spotify"];

  imports = [inputs.spicetify-nix.homeManagerModule];

  home.packages = [pkgs.spotify];

  programs.spicetify = {
    spotifyPackage = pkgs.spotify;

    # enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      #     shuffle # shuffle+ (special characters are sanitized out of ext names)
      # hidePodcasts
    ];
  };
}
