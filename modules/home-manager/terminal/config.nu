#!/usr/bin/env nu

let config_dir = $env.HOME + "/nixos"
let logfile = "nixos-switch.log"

def rebuild [] {
  cd $config_dir
  alejandra -q .

  git diff -U0 "*.nix"
  git add "."

  echo "NixOS Rebuilding..."

  sudo nixos-rebuild switch --flake $'($config_dir)#default' out> "nixos-switch.log" | ignore

  if $env.LAST_EXIT_CODE != 0 {
    open --raw "nixos-switch.log" | find error
    "Failed to Build"
  } else {
    let msg = nixos-rebuild list-generations | find "current";
    git commit -m $msg

    "Successfully Built NixOS"
  }
}

# vim: ft=nu
