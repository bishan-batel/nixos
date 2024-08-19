{
  config,
  pkgs,
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
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bishan_";
  home.homeDirectory = "/home/bishan_";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bishan_/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    BROWSER = "firefox";
    XDG_PICTURES_DIR = "Pictures";
    XDG_DOWNLOADS_DIR = "Downloads";
    XDG_VIDEOS_DIR = "Videos";
  };

  # TODO
  # xdg.configFile."hypr/hyprland.conf".soruce = ./hypr/hyprland.conf;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
