

export def rebuild []  {
  let config_dir = $env.HOME + "/nixos";
  let logfile = $"($config_dir)/nixos-switch.log";

  print $"Entering ($config_dir)";
  cd $config_dir;


  print "Formatting..."
  alejandra -q .;

  git diff -U0 "*.nix" ;
  git add .;

  print "NixOS Rebuilding...";

  let output = sudo nixos-rebuild switch --flake $'($config_dir)#default' | complete 

  echo $output.stdout | save -f $logfile
  echo $output.stderr | save -a $logfile

  if $output.exit_code != 0 {
    open --raw $logfile | grep --color error
    print "Failed to Build"
  } else {
    let generations = nixos-rebuild list-generations --json | from json

    let current = $generations | where "current" | select generation date | first
    let current_gen = $current | get generation 
    let date = $current | get date 

    let msg = $'Generation ($current_gen): ($date)'
    git commit -m $msg | ignore

    print $"Successfully Built NixOS: '($msg)'"
  }
}

# vim: ft=nu
