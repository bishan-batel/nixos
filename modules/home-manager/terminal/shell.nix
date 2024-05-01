{ pkgs, ...}:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    alias ls="lsd -lah"
    alias ll="lsd -lah"
    alias lt="lsd -lah --tree"
    alias cd="z"
    alias ci="zi"
    '';
  };
}
