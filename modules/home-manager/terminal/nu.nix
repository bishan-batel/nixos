{pkgs, ...}: {
  home.packages = with pkgs; [alejandra];

  programs = {
    nushell = {
      enable = true;

      shellAliases = {
        "la" = "ls -a";
        "ll" = "ls -la";
        "ns" = "nix-shell --cmd nu";
        "cd" = "z";
        "ci" = "zi";
        "cat" = "bat";
        "diff" = "delta";
        "bt" = "bluetoothctl";
        "weeb" = "ani-cli";
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
