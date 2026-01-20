{pkgs, ...}: {
  boot.loader = {
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 1;
    };
    efi.canTouchEfiVariables = true;
  };

  catppuccin.grub.enable = true;

  boot.supportedFilesystems = ["ntfs"];

  environment.systemPackages = [pkgs.ntfs3g];
}
