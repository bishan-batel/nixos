{pkgs, config,  ...}: let
  ghostty-config-path = (if pkgs.stdenv.isDarwin 
    then "/Users/bishan_/nixos/modules/home/terminal/ghostty.conf" 
    else "/home/bishan_/nixos/modules/home/terminal/ghostty.conf");
in
{
  home.packages = with pkgs; [ ghostty-bin ];

  xdg.configFile."ghostty/config".source = config.lib.file.mkOutOfStoreSymlink ghostty-config-path;
}
