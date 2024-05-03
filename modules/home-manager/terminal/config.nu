#!/usr/bin/env nu

let config_dir = $env.HOME + "/nixos"
let logfile = "nixos-switch.log"

def rebuild [] {
  cd $config_dir
  alejandra -q . | ignore

  git diff -U0 "*.nix"
  git add "." 

  echo "NixOS Rebuilding..."

  let log = sudo nixos-rebuild switch --flake $'($config_dir)#default' 
  open --raw $logfile e> $logfile

  if $env.LAST_EXIT_CODE != 0 {
    open --raw $logfile | find error
    "Failed to Build"
  } else {
    let msg = nixos-rebuild list-generations | find "current" ;
    git commit -m '($msg)'

    "Successfully Built NixOS: '($msg |into string)'"
  }
}

# vim: ft=nu
