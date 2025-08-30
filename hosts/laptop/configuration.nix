# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nix-ld.nix
    ../../modules/man.nix
    ../../modules/auto-upgrade.nix
    ../../modules/nh.nix
    ../../modules/cachix.nix
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  console.catppuccin.enable = true;
  boot.loader.grub.catppuccin.enable = true;

  networking.hostName = "laptop"; # Define your hostname.
  #  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # time.timeZone = "America/Chicago";
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  users.users.bishan_ = {
    isNormalUser = true;
    description = "Kishan S Patel";
    extraGroups = ["networkmanager" "wheel" "disk"];
    packages = with pkgs; [
      linuxKernel.packages.linux_zen.perf
      legcord
      # xwaylandvideobridge
      acpi
      wtype
      inputs.lobster.packages.x86_64-linux.lobster
      brightnessctl
    ];
  };

  # === Ricefields ===
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "bishan_" = import ./home.nix;
    };
    backupFileExtension = "backup";
  };

  services.dbus = {enable = true;};

  services.gnome.at-spi2-core.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;
  nixpkgs.config.allowUnsupportedSystem = true;

  networking.firewall.checkReversePath = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wireguard-tools
    protonvpn-gui
    git
    zip
    unzip
    nushell
    v4l-utils
    linuxPackages.v4l2loopback

    wine
    wine64
    wineWowPackages.waylandFull
    winetricks

    qmk-udev-rules
    via
    qmk
  ];

  programs.coolercontrol = {
    enable = false;
    nvidiaSupport = true;
  };
  services.udev = {
    enable = true;
    packages = with pkgs; [via qmk-udev-rules];
  };

  # SDDM
  services.displayManager = {
    sddm = {
      package = pkgs.kdePackages.sddm;
      enable = true;
      wayland.enable = true;
    };
  };
  services.xserver.enable = true;

  # Hyprland

  users.users.bishan_.shell = pkgs.nushell;

  security.rtkit.enable = true;

  services.printing.enable = true;

  # sound.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    audio.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--no-write-lock-file"
      "-L"
    ];
    dates = "06:00";
    randomizedDelaySec = "45min";
  };

  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      #pkgs.xwaylandvideobridge
    ];
  };

  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = false;
  };

  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatabilitytools.d";
  };

  # Power management
  services = {
    thermald.enable = true;

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "performance";
  };

  security.pam.services.hyprlock = {};

  services.xremap = {
    enable = true;
    serviceMode = "user";
    userName = "bishan_";

    config = {
      modmap = [
        {remap = {"CapsLock" = "Esc";};}
      ];

      # Keymap for key combo rebinds
      keymap = [
        {
          remap = {
            "Alt_R-h" = "left";
            "Alt_R-j" = "down";
            "Alt_R-k" = "up";
            "Alt_R-l" = "right";
            "Alt_R-t".press.launch = ["nu" "-c" "wtype Δ"];
          };
        }

        {
          name = "Rofi";
          application.only = "rofi";
          remap = {
            "C-p" = "up";
            "C-n" = "down";

            "C-h" = "left";
            "C-j" = "down";
            "C-k" = "up";
            "C-l" = "right";
          };
        }
      ];
    };
  };
}
