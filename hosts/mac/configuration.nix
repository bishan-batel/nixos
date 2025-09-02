{ pkgs, inputs, ... } : {


	imports = [
    # builtins.fetchurl {
    #   url = "https://raw.githubusercontent.com/Atemu/home-manager/e6d905336181ed8f98d48a1f6c9965b77f18e304/modules/targets/darwin.nix";
    #   sha256 = "0lsa8ncwvv5qzar2sa8mxblhg6wcq5y6h9ny7kgmsby4wzaryz67";
    # }
	];

	environment.systemPackages = with pkgs; [
		nushell
		neovim
	];

	# Necessary for using flakes on this system.
	nix.settings.experimental-features = "nix-command flakes";

	# Set Git commit hash for darwin-version.
	# system.configurationRevision = self.rev or self.dirtyRev or null;

	# Used for backwards compatibility, please read the changelog before changing.
	# $ darwin-rebuild changelog
	system.stateVersion = 6;

	# The platform the configuration will be used on.
	nixpkgs.hostPlatform = "aarch64-darwin";

	security.pam.services.sudo_local.touchIdAuth = true;

	nixpkgs.config = {
		allowUnfree = true;
		allowUnfreePredicate = _: true;
		allowUnsupportedSystem = true;
	};

	users.users.bishan_.home = "/Users/bishan_";

	system.primaryUser = "bishan_";

	home-manager = {
		extraSpecialArgs = {inherit inputs;};

		useGlobalPkgs = true;
		useUserPackages = true;
		users.bishan_ = import ./home.nix;
		backupFileExtension = "backup";
	};
	services.yabai = {
		enable = true;
		enableScriptingAddition = true;
		config = {
			focus_follows_mouse          = "autoraise";
			mouse_follows_focus          = "off";
			window_placement             = "second_child";
			window_opacity               = "off";
			window_opacity_duration      = "0.0";
			window_border                = "on";
			window_border_placement      = "inset";
			window_border_width          = 2;
			window_border_radius         = 3;
			active_window_border_topmost = "off";
			window_topmost               = "on";
			window_shadow                = "float";
			active_window_border_color   = "0xff5c7e81";
			normal_window_border_color   = "0xff505050";
			insert_window_border_color   = "0xffd75f5f";
			active_window_opacity        = "1.0";
			normal_window_opacity        = "1.0";
			split_ratio                  = "0.50";
			auto_balance                 = "on";
			mouse_modifier               = "fn";
			mouse_action1                = "move";
			mouse_action2                = "resize";
			layout                       = "bsp";
			top_padding                  = 20;
			bottom_padding               = 20;
			left_padding                 = 20;
			right_padding                = 20;
			window_gap                   = 10;
		};


		extraConfig = /*bash*/ ''
	# rules
	yabai -m rule --add app='System Preferences' manage=off

	# Any other arbitrary config here
		'';
	};
}
