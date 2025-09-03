{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    gimp3-with-plugins
    krita
    inkscape
    thunderbird
    quickemu

    # libreoffice
    reaper
    libreoffice-qt
    hunspell

    # audacity
    # yabridge
    # yabridgectl

    bottles

    mixxx
    blender
  ];

  programs.zathura = {
    enable = true;
  };

  programs = {
    obs-studio = {
      enable = true;
      # enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };
}
