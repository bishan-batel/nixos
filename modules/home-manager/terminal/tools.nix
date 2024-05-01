{ pkgs, ... }:
{
  programs = {
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    lsd = {
      enableAliases = true;
      settings = {
        date = "relative";
        ignore-globs = [
          ".git"
        ];
      };
    };

    btop = {
      enable = true;
      catppuccin.enable = true;
    };

    bat = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
