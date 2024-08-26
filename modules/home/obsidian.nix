{pkgs, ...}: {
  home.sessionVariables.NIXOS_OZONE_WL = pkgs.lib.mkOverride 1 "0";

  home.packages = [pkgs.obsidian];
}
