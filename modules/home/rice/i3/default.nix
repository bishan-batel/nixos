{ pkgs, ... }: {

  home.packages = [
    i3status
    i3blocks
    clipit
  ];
  xsession.windowManager = {
    enable = true;
    package = pkgs.i3-gaps;


    extraConfig = /*bash*/ '' 
      include ${config.lib.file.mkOutOfStoreSymlink "/home/bishan_/nixos/modules/home/rice/i3/config"}
    '';
  };
}
