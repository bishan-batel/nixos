{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [];

  home.file."${config.xdg.configHome}/vesktop/themes/catppuccin-mocha.theme.css".source = ./rice/discord-catppuccin-mocha.theme.css;
}
