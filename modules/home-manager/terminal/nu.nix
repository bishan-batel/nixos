{pkgs, ...}: {
  home.packages = with pkgs; [alejandra];

  programs = {
    nushell = {
      enable = true;

      shellAliases = {
        #"ls" = "lsd -lah";
        "la" = "ls -a";
        "ll" = "ls -la";
        #"lt" = "lsd -lah --tree";
        "cd" = "z";
        "ci" = "zi";
        "cat" = "bat";
        "diff" = "delta";
        "bt" = "bluetoothctl";
      };

      configFile.source = ./config.nu;
      envFile.source = ./env.nu;
    };

    carapace.enableNushellIntegration = true;
    zoxide.enableNushellIntegration = true;
    yazi.enableNushellIntegration = true;
    starship.enableNushellIntegration = true;
  };
}
