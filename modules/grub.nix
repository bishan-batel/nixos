{pkgs, ...}: {
  boot.loader = {
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 1;

      # Theming
      catppuccin.enable = true;
    };
    efi.canTouchEfiVariables = true;
  };
}
