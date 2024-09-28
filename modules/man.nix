{pkgs, ...}: {
  documentation = {
    dev.enable = true;
    man = {
      enable = true;
      man-db.enable = false;
      mandoc.enable = true;
      generateCaches = true;
    };
  };

  environment.systemPackages = with pkgs; [
    tldr
    linux-manual
    man-pages
    man-pages-posix
  ];
}
