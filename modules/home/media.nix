{pkgs, ...}: {
  home.packages = with pkgs; [
    ani-cli
    blockbench
    feh
  ];

  programs = {
    mpv.enable = true;
    zathura = {
      enable = true;
      options = {
        "scroll-step" = 20;
        "smooth-scroll" = true;
      };
    };
  };
}
