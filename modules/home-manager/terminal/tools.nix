{pkgs, ...}: {
  home.packages = with pkgs; [
    delta
  ];

  programs = {
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    lsd = {
      enable = true;
      settings = {
        date = "relative";
        ignore-globs = [
          ".git"
        ];
      };
    };

    btop = {
      enable = true;

      settings = {
        vim_keys = true;
        rounded_corners = true;
      };

      catppuccin.enable = true;
    };

    bat = {
      enable = true;
      catppuccin.enable = true;
    };

    fzf = {
      tmux.enableShellIntegration = true;
      enableFishIntegration = true;
      catppuccin.enable = true;
    };
  };
}
