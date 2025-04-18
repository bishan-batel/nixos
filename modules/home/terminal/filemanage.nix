{pkgs, ...}: {
  programs = {
    ripgrep.enable = true;

    yazi = {
      enable = true;

      settings = {
        show_hidden = true;
      };
    };

    zoxide = {enable = true;};

    # also lsd has nice config options in a conf file,
    # try sudo apt update?

    lsd = {
      enable = true;
      settings = {
        date = "relative";
        ignore-globs = [
          ".git"
        ];
      };
    };

    bat = {
      enable = true;
    };

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };
  };
}
