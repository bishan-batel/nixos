#!/usr/bin/env nu

let config_dir = $env.HOME + "/nixos"
let logfile = "nixos-switch.log"

def rebuild [] {
  cd $config_dir
  alejandra . | ignore 
  git diff -U0 "*.nix"
  git add "."

  echo "NixOS Rebuilding..."

  sudo nixos-rebuild switch --flake $'($config_dir)#default' out> "nixos-switch.log" | ignore

  if $env.LAST_EXIT_CODE != 0 {
    open --raw "nixos-switch.log" | find error
    "Failed to Build"
  } else {
    git commit -m "$(nixos-rebuild list-generations | grep current)"

    "Successfully Built NixOS"
  }
}

#       pushd /home/bishan_/nixos
#       alejandra . &> /dev/null
#       git add .
#       git diff -U0 "*.nix"
#       echo NixOS Rebuilding...
#       sudo nixos-rebuild switch --flake /home/bishan_/nixos#default &>nixos-switch.log

#       if [ $status != 0 ];
#         bat nixos-switch.log | grep --color error && false
#         echo Failed to build.
#       else
#         git commit -m "$(nixos-rebuild list-generations | grep current)"
#       end
#       popd


# vim: ft=nu
