{pkgs, ...}: {
  programs = {
    gh-dash = {
      enable = true;
      catppuccin = {
        enable = true;
        accent = "mauve";
        flavor = "mocha";
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      extensions = with pkgs; [gh-dash];
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
        http.sslVerify = false;
      };

      aliases = {};

      delta = {
        enable = true;
        catppuccin = {
          enable = true;
          flavor = "mocha";
          # accent = "mauve";
        };
      };
    };
  };
}
