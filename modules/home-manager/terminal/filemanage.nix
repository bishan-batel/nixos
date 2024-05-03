{pkgs, ...}: {
  programs = {
    yazi = {
      enable = true;

      settings = {
        show_hidden = true;
      };

      catppuccin.enable = true;
    };

    zoxide = {enable = true;};

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
      catppuccin.enable = true;
    };

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
      catppuccin.enable = true;
    };
  };
}
