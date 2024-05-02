{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
    git-credential-oauth
  ];

  programs.gh-dash = {
    enable = true;
    # settings = {};
    catppuccin.enable = true;
  };

  programs.git = {
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
}
