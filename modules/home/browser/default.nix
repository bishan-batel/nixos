{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    brave 
    firefox
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
