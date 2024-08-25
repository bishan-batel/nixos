{pkgs, ...}: {
  home.packages = with pkgs; [
    texlive.combined.scheme-full
    ffmpeg
    yt-dlp
  ];
}
