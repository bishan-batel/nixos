{
  pkgs,
  inputs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };

  home.packages = with pkgs; [
    jetbrains-toolbox
    #jetbrains.clion
    #jetbrains.rider
    #jetbrains.rust-rover
  ];
}
