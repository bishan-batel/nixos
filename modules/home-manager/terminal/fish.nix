{pkgs, ...}: {
  programs.fish = {
    enable = false;
    interactiveShellInit = ''
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
