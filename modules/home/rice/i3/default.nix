{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    clipit
  ];

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
}
