{pkgs, ...}: {
  home.packages = with pkgs; [alejandra];

  programs = {
    nushell = {
      enable = true;

      shellAliases = {
        "ls" = "lsd -lah";
        "ll" = "lsd -lah";
        "lt" = "lsd -lah --tree";
        "cd" = "z";
        "ci" = "zi";
        "cat" = "bat";
        "diff" = "delta";
      };

      configFile.source = ./config.nu;
    };

    carapace.enableNushellIntegration = true;
    zoxide.enableNushellIntegration = true;
    yazi.enableNushellIntegration = true;
    starship.enableNushellIntegration = true;
  };
}
