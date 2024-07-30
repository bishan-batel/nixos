# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd = {
    availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
    kernelModules = ["amdgpu"];
  };
  boot.kernelModules = ["kvm-amd" "v4l2loopback"];

  boot.extraModulePackages = [pkgs.linuxPackages.v4l2loopback];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  security.polkit.enable = true;

  boot.kernel.sysctl = {
    "kernel.perf_event_paranoid" = -1;
    "kernel.kptr_restrict" = lib.mkForce 0;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/22792390-a0c7-4bf3-8cf6-417c389804a8";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9AC5-1AF7";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/f1b6fd96-adb7-4e22-a60c-b0dbc9677361";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp34s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };

    graphics = {
      enable = true;

      extraPackages = with pkgs; [
        amdvlk
      ];

      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  services.xserver.videoDrivers = ["amdgpu"];

  systemd.services.lactd.enable = true;
  environment.systemPackages = with pkgs; [lact];
  # services.lact.enable = true;
}
