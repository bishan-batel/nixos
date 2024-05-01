{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    firefox
    gimp
  ];
}
