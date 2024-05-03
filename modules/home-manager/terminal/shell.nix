{pkgs, ...}: {
  home.packages = with pkgs; [alejandra];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      alias ls="lsd -lah"
      alias ll="lsd -lah"
      alias lt="lsd -lah --tree"
      alias cd="z"
      alias ci="zi"
      alias cat="bat"
      alias diff="delta"
    '';
    functions = {
      rebuild = ''
        pushd /home/bishan_/nixos
        alejandra . &> /dev/null
        git add .
        git diff -U0 "*.nix"
        echo NixOS Rebuilding...
        sudo nixos-rebuild switch --flake /home/bishan_/nixos#default &>nixos-switch.log

        if [ $status != 0 ];
          bat nixos-switch.log | grep --color error && false
          echo Failed to build.
        else
          git commit -m "$(nixos-rebuild list-generations | grep current)"
        end
        popd
      '';
    };
  };
}
