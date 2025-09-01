{ pkgs, config, inputs, ... }: {

  imports = [
    ../../modules/home/terminal/starship.nix
    ../../modules/home/nvim.nix
    ../../modules/home/git.nix
    # ../../modules/home/rice/spicetify.nix
    inputs.catppuccin.homeModules.catppuccin
  ];

  programs.home-manager.enable = true;

  home = { 
    username = "bishan_";
    stateVersion = "23.11";
    homeDirectory = "/Users/bishan_";
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
    spotify
    nerd-fonts.jetbrains-mono
    nerd-fonts.agave
  ];
}
