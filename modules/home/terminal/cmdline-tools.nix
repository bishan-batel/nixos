{pkgs, ...}: {
  home.packages = with pkgs; [
    # texlive.combined.scheme-full
    ffmpeg
    yt-dlp
    fd
    tectonic
    doas
    thefuck
  ];
}
