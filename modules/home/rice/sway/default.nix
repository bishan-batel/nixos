{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.sway = {
    #   enable = false;
    #   wrapperFeatures.gtk = true;

    #   config = {};

    #   extraConfig =
    #     /*
    #     bash
    #     */
    #     ''
    #       include /home/bishan_/nixos/modules/home/rice/sway/sway.conf;
    #     '';
  };

  xdg.configFile."sway/config".source = config.lib.file.mkOutOfStoreSymlink "/home/bishan_/nixos/modules/home/rice/sway/sway.conf";


  services.picom.enable = true;
}
