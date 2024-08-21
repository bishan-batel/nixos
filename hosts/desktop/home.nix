{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/compilers.nix
    ../../modules/home-manager/editors.nix
    ../../modules/home-manager/spotify.nix
    ../../modules/home-manager/utilities.nix
    ../../modules/home-manager/gaming.nix
    ../../modules/home-manager/discord.nix
    ../../modules/home-manager/browser.nix
    ../../modules/home-manager/media.nix
    ../../modules/home-manager/terminal
    ../../modules/home-manager/rice
    ../../modules/home-manager/keyboard.nix
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "bishan_";
    homeDirectory = "/home/bishan_";
    stateVersion = "23.11";

    packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];

    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;
    };

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
      BROWSER = "firefox";
      XDG_PICTURES_DIR = "Pictures";
      XDG_DOWNLOADS_DIR = "Downloads";
      XDG_VIDEOS_DIR = "Videos";
    };
  };
}
