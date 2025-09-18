{pkgs, ...}: {
  home.packages = with pkgs; [
    # texlive.combined.scheme-full
    ffmpeg
    yt-dlp
    fd
    tectonic
    speedtest-cli
    spotdl
  ];

  programs.btop = {
    enable = true;

    settings = {
      vim_keys = true;
      rounded_corners = true;
    };
  };
}
