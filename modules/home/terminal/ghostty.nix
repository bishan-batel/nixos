{
  pkgs,
  config,
  ...
}: let
  ghostty-config-path =
    if pkgs.stdenv.isDarwin
    then "/Users/bishan_/nixos/modules/home/terminal/ghostty.conf"
    else "/home/bishan_/nixos/modules/home/terminal/ghostty_linux.conf";
in {
  home.packages = with pkgs; [
    (if pkgs.stdenv.isDarwin then ghostty-bin else ghostty)
  ];

  xdg.configFile."ghostty/config".source = config.lib.file.mkOutOfStoreSymlink ghostty-config-path;
}
