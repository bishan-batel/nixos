{ pkgs, inputs, ... }:
{

  imports = [
    inputs.zen-browser.homeModules.default
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
    # inputs.zen-browser.packages."${pkgs.system}".beta
  ];

  home.packages = with pkgs; [
    brave
    firefox
  ];

  programs.zen-browser = {
    # enabl = true;
    # setAsDefaultBrowser = true;

    profiles.default.presets.catppuccin = {
      enable = true;
      flavor = "Mocha"; # Frappe | Latte | Macchiato | Mocha
      accent = "Mauve"; # Blue, Flamingo, Green, Lavender, Maroon, Mauve, ...
    };

    darwinDefaultsId = "app.zen-browser.zen.plist";

  };
}
