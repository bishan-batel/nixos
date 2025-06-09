{
  pkgs,
  inputs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      jetbrains-toolbox
      vscode
    ];
  };
}
