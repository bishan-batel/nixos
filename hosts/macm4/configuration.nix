{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/home/mac/sxhkd.nix
    ../../modules/home/mac/yabai.nix
    # ../../modules/home/mac/amethyst.nix
  ];

  environment.systemPackages = with pkgs; [
    nushell
    neovim
    mesa
    # inputs.lobster.packages.x86_64-darwin.lobster
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  nix.package = pkgs.lixPackageSets.stable.lix;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  security.pam.services.sudo_local.touchIdAuth = true;

  # services.dbus.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    allowUnsupportedSystem = true;
  };

  users.users.bishan_ = {
    home = "/Users/bishan_";
    shell = pkgs.nushell;
  };

  environment.shells = with pkgs; [nushell];

  system.primaryUser = "bishan_";

  home-manager = {
    extraSpecialArgs = {inherit inputs;};

    useGlobalPkgs = true;
    useUserPackages = true;
    users.bishan_ = import ./home.nix;
    backupFileExtension = "backup";
  };
  homebrew = {
    enable = true;

    taps = [];
    brews = ["gsed"];
    casks = ["xquartz"];
  };
}
