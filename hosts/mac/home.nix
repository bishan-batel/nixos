{ pkgs, config, lib, inputs, ... }: {

  imports = [
    ../../modules/home/terminal/starship.nix
    ../../modules/home/nvim.nix
    ../../modules/home/git.nix
    ../../modules/home/terminal/kitty.nix
    ../../modules/home/terminal/tmux.nix
    ../../modules/home/rice/spicetify.nix
    ../../modules/home/terminal/nu.nix
    inputs.catppuccin.homeModules.catppuccin
  ];

  programs.home-manager.enable = true;

  home = { 
    username = "bishan_";
    stateVersion = "23.11";
    homeDirectory = "/Users/bishan_";
  };

  home.file."Applications/home-manager".source = let
    apps = pkgs.buildEnv {
      name = "home-manager-applications";
      paths = config.home.packages;
      pathsToLink = "/Applications";
    };
  in "${apps}/Applications";

  home.activation = {
    aliasApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      app_folder=$(echo ~/Applications);
      for app in $(find "$genProfilePath/home-path/Applications" -type l); do
	$DRY_RUN_CMD rm -f $app_folder/$(basename $app)
	$DRY_RUN_CMD osascript -e "tell app \"Finder\"" -e "make new alias file at POSIX file \"$app_folder\" to POSIX file \"$app\"" -e "set name of result to \"$(basename $app)\"" -e "end tell"
      done
    '';
  };

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";

    yazi.enable = true;
    bat.enable = true;
    fzf.enable = true;
    kitty.enable = true;
    starship.enable = true;
    gh-dash.enable = true;
    delta.enable = true;
    # gtk.enable = true;
    # gtk.icon.enable = true;
    zathura.enable = true;
    btop.enable = true;

    mpv.enable = true;
    imv.enable = true;
    nvim.enable = false;
  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
	monospace = ["JetBrainsMono"];
	sansSerif = ["JetBrainsMono"];
	serif = ["JetBrainsMono"];
      };
    };
  };

  home.packages = with pkgs; [
    # spotify
    nerd-fonts.jetbrains-mono
    nerd-fonts.agave
  ];

}
