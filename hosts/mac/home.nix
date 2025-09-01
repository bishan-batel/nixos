{ pkgs, ... }; {

	imports = [
		../../modules/home/terminal/starship.nix
		../../modules/home/terminal/git.nix
		../../modules/home/terminal/git.nix
		../../modules/home/terminal/nvim.nix
	];
	programs.starship = {
		enable = true;
	};
}
