{pkgs, ...}: {
  home.packages = [
    pkgs.mkDesktopItem
    {
      name = "goos-desktop-item";
      desktopName = "Goose";
      exec = "kitty";
      terminal = false;
    }
  ];
}
