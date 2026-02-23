{pkgs, ...}: {
  programs = {
    lazygit = {
      enable = true;
      settings = {};
    };

    gh-dash.enable = true;

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      extensions = with pkgs; [gh-dash];
    };

    git = {
      enable = true;

      settings = {
        user = {
          name = "Kishan S Patel";
          email = "bishan.batel@protonmail.com";
        };

        alias = {};

        url = {
          "https://github.com/" = {insteadOf = "gh:";};
        };

        init.defaultBranch = "main";
        credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
        http.sslVerify = false;
      };
    };

    delta = {
      enable = true;
      enableGitIntegration = true;
    };
  };

  home.packages = with pkgs; [p4 p4v];
}
