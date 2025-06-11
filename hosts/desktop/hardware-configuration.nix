{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../../modules/grub.nix
  ];

  boot = {
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = ["amdgpu"];
    };

    kernelModules = ["kvm-amd" "v4l2loopback"];

    extraModulePackages = [
      pkgs.linuxPackages.v4l2loopback
      # pkgs.linuxKernel.packages.linux_6_12.v4l2loopback-dkms
    ];

    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';

    kernel.sysctl = {
      "kernel.perf_event_paranoid" = -1;
      "kernel.kptr_restrict" = lib.mkForce 0;
    };
  };

  security.polkit.enable = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/22792390-a0c7-4bf3-8cf6-417c389804a8";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/9AC5-1AF7";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };
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

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        mesa
        libva
        libvdpau-va-gl
        vulkan-loader
        vulkan-validation-layers
        amdvlk # Optional: AMD's proprietary Vulkan driver
        mesa.opencl # Enables Rusticl (OpenCL) support
        rocmPackages.clr.icd
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

    keyboard = {
      qmk.enable = true;
    };
  };

  # systemd.services.lactd.enable = true;

  services = {
    xserver.videoDrivers = ["amdgpu"];
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };

  services.lact.enable = true;
}
