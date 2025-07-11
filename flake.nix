{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";

    xremap-flake.url = "github:xremap/nix-flake";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland.url = "github:hyprwm/Hyprland";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    ags.url = "github:Aylur/ags";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lobster.url = "github:justchokingaround/lobster";

    musnix.url = "github:musnix/musnix";
  };

  outputs = {
    self,
    nixpkgs,
    catppuccin,
    home-manager,
    hyprland-qtutils,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    config = {allowUnfree = true;};
    overlays = [
    ];
  in {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/desktop/configuration.nix
        # inputs.xremap-flake.nixosModules.default
        inputs.catppuccin.nixosModules.catppuccin
        inputs.home-manager.nixosModules.home-manager
        # inputs.flake-programs-sqlite.nixosModules.programs-sqlite
        inputs.musnix.nixosModules.musnix
      ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/laptop/configuration.nix
        inputs.xremap-flake.nixosModules.default
        inputs.catppuccin.nixosModules.catppuccin
        inputs.home-manager.nixosModules.home-manager
        # inputs.flake-programs-sqlite.nixosModules.programs-sqlite
      ];
    };

    homeConfigurations.bishan_ = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        catppuccin.homeManagerModules.catppuccin
      ];
    };
  };
}
