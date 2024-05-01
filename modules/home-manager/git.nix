{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
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

