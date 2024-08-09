{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    gimp
    zathura
    obsidian
    sway-contrib.grimshot
    thunderbird
    tdf
    texlive.combined.scheme-full
  ];

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
