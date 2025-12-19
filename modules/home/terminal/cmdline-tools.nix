{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg
    yt-dlp
    fd
    tectonic
    speedtest-cli
    spotdl
    dust
    xh
    hyperfine
    tokei
    wiki-tui
    zellij
  ];

  programs.btop = {
    enable = true;

    settings = {
      vim_keys = true;
      rounded_corners = true;
    };
  };
}
