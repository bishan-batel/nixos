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
    ../../modules/grub.nix
  ];

  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "nvme" "thunderbolt" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];

      kernelModules = [];
    };

    kernelModules = ["kvm-intel" "v4l2loopback"];

    extraModulePackages = with pkgs; [linuxPackages.v4l2loopback];

    kernel.sysctl."vm.max_map_count" = 2147483642;
    blacklistedKernelModules = ["nouveau"];

    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';

    kernel.sysctl = {
      "kernel.perf_event_paranoid" = -1;
      "kernel.kptr_restrict" = lib.mkForce 0;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/06c4c11b-faf2-4901-8aad-1404cf53e1d5";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/C4FA-7F70";
      options = ["fmask=0022" "dmask=0022"];
    };
  };

  # swapDevices = [
  #   {
  #     device = "/dev/disk/by-uuid/6d464dd9-28e8-4092-9727-dd0ad1fc0c3b";
  #   }
  # ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno2.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };

      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "565.57.01";
        sha256_64bit = "sha256-buvpTlheOF6IBPWnQVLfQUiHv4GcwhvZW3Ks0PsYLHo=";
        sha256_aarch64 = lib.fakeSha256;
        openSha256 = lib.fakeSha256;
        settingsSha256 = "sha256-H7uEe34LdmUFcMcS6bz7sbpYhg9zPCb/5AmZZFTx1QA=";
        persistencedSha256 = lib.fakeSha256;
      };

      open = false;

      nvidiaSettings = true;

      prime = {
        # sync.enable = true;

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:01:0:0";

        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };

    logitech.wireless.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];

      extraPackages32 = with pkgs; [
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
    xserver.videoDrivers = ["nvidia"];
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };

  specialisation = {
    on-the-go.configuration = {
      system.nixos.tags = ["on-the-go"];
      # hardware.nvidia = {
      #   prime.offload.enable = lib.mkForce true;
      #   prime.offload.enableOffloadCmd = lib.mkForce true;
      #   prime.sync.enable = lib.mkForce false;
      # };
      boot.extraModprobeConfig = lib.mkForce ''
        blacklist nouveau
        options nouveau modeset=0
      '';

      services.udev.extraRules = lib.mkForce ''
        # Remove NVIDIA USB xHCI Host Controller devices, if present
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
        # Remove NVIDIA USB Type-C UCSI devices, if present
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
        # Remove NVIDIA Audio devices, if present
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
        # Remove NVIDIA VGA/3D controller devices
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
      '';
      boot.blacklistedKernelModules = ["nouveau" "nvidia" "nvidia_drm" "nvidia_modeset"];
    };
  };
}
