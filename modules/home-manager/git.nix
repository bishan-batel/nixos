{pkgs, ...}: {
  home.packages = with pkgs; [gh];

  programs = {
    gh-dash = {
      enable = true;
      # settings = {};
      catppuccin.enable = true;
    };

    gh = {
      # gitCredentialHelper.enable = true;
      # extensions = [pkgs.gh-dash];
    };

    git = {
      enable = true;
      userName = "Kishan S Patel";
      userEmail = "bishan.batel@protonmail.com";

      extraConfig = {
        url = {
          "https://github.com/" = {insteadOf = "gh:";};
        };

        init.defaultBranch = "main";
        credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
      };

      aliases = {};

      delta = {
        enable = true;
      };
    };
  };
}
