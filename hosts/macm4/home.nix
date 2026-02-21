{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ../../modules/home/terminal/starship.nix
    ../../modules/home/terminal/cmdline-tools.nix
    ../../modules/home/terminal/kitty.nix
    ../../modules/home/terminal/tmux.nix
    ../../modules/home/terminal/nu.nix
    ../../modules/home/terminal/filemanage.nix

    ../../modules/home/browser/default.nix

    # ../../modules/home/discord.nix
    ../../modules/home/media.nix

    ../../modules/home/dev

    inputs.catppuccin.homeModules.catppuccin
    inputs.mac-app-util.homeManagerModules.default
  ];

  programs.home-manager.enable = true;

  home = {
    username = "bishan_";
    stateVersion = "23.11";
    homeDirectory = "/Users/bishan_";
  };

  targets.darwin.linkApps.enable = true;

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
        monospace = [ "JetBrainsMono" ];
        sansSerif = [ "JetBrainsMono" ];
        serif = [ "JetBrainsMono" ];
      };
    };
  };

  home.packages = with pkgs; [
    # spotify
    nerd-fonts.jetbrains-mono
    nerd-fonts.agave
    jetbrains-toolbox
    p4v
    p4
    iina
  ];

  programs.nh = {
    enable = true;
    # clean.enable = true;
    # clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/Users/bishan_/nixos";
  };
}
