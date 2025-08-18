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

      delta.enable = true;
    };
  };
}
