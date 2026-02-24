{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    xclip
    arandr
    picom
    xborders
    flameshot
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;

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
