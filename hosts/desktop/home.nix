{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/compilers.nix
    ../../modules/home/editors.nix
    ../../modules/home/nvim.nix
    ../../modules/home/utilities.nix
    ../../modules/home/gaming.nix
    ../../modules/home/discord.nix
    ../../modules/home/browser
    ../../modules/home/media.nix
    ../../modules/home/obsidian.nix
    ../../modules/home/terminal
    ../../modules/home/rice
    ../../modules/home/dev
    ../../modules/home/keyboard.nix
    ../../modules/wayland.nix
    ../../modules/home/content.nix
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "bishan_";
    homeDirectory = "/home/bishan_";
    stateVersion = "23.11";

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
      NIXOS_OZONE_WL = "1";
    };
  };
}
