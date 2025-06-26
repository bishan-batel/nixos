{
  config,
  pkgs,
  ...
}: {
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 4d --kep 3";
    };

    flake = "/home/bishan_/nixos";
  };
}
