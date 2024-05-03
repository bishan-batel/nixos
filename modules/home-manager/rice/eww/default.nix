{
  pkgs,
  inputs,
  ...
}: {
  programs.eww = {
    enable = true;
    configDir = ./.;
  };
}
