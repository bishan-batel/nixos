{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    gimp
    obsidian
    sway-contrib.grimshot
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  programs = {
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
