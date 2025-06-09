{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    gimp3-with-plugins
    thunderbird
    quickemu

    # libreoffice
    reaper
    libreoffice-qt
    hunspell

    audacity
    yabridge
    yabridgectl

    bottles

    mixxx
  ];

  programs.zathura = {
    enable = true;
    catppuccin.enable = true;
  };

  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
    btop = {
      enable = true;

      settings = {
        vim_keys = true;
        rounded_corners = true;
      };

      catppuccin.enable = true;
    };
  };
}
