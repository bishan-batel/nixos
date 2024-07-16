{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.eww = {
    enable = true;
    configDir = ./.;
  };
}
