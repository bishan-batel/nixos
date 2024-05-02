{pkgs, ...}: {
  home.packages = with pkgs; [
    git-credential-oauth
    gh
  ];

  programs = {
    gh-dash = {
      enable = true;
      # settings = {};
      catppuccin.enable = true;
    };

    gh = {
      gitCredentialHelper.enable = true;
      extensions = [pkgs.gh-dash];
    };

    git = {
      enable = true;
      userName = "Kishan S Patel";
      userEmail = "bishan.batel@protonmail.com";

      extraConfig = {
        url = {
          "https://github.com/" = {
            insteadOf = "gh:";
          };
        };

        init.defaultBranch = "main";
        credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
      };

      aliases = {};
    };
  };
}
