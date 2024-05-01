{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      config = { allowUnfree = true; };
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.catppuccin.nixosModules.catppuccin
        ];
      };
  };
}