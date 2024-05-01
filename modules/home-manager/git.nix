{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
    git-credential-oauth
  ];

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
    };


    aliases = {};
  };
}

