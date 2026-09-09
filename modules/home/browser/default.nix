{pkgs, inputs, ...}: {

  imports = [
    inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  home.packages = with pkgs; [brave firefox];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };
}
