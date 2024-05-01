{ pkgs, ...}:
{
  gtk = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono";

    catppuccin = { enable = true; };
  };

  xdg = {
    enable = true;
  };
}
