#!/usr/bin/env nu

let config_dir = $env.HOME + "/nixos"
let logfile = "nixos-switch.log"

def rebuild [] {
  cd $config_dir
  alejandra -q . | ignore

  git diff -U0 "*.nix"
  git add "." 

  echo "NixOS Rebuilding..."

  sudo nixos-rebuild switch --flake $'($config_dir)#default' | save -f $logfile

  if $env.LAST_EXIT_CODE != 0 {
    open --raw $logfile | find error
    "Failed to Build"
  } else {
    let generations = nixos-rebuild list-generations --json | from json

    let current = $generations | where "current" | select generation date 

    let current_gen = $current | get generation | first
    let date = $current | get date | first

    let msg = $'Generation ($current_gen): ($date)'
    git commit -m $msg

    $"Successfully Built NixOS: '($msg)'"
  }
}

# vim: ft=nu
