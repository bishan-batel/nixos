

export def rebuild []  {
  let config_dir = $env.HOME + "/nixos";
  let logfile = $"($config_dir)/nixos-switch.log";

  print $"Entering ($config_dir)";
  cd $config_dir;


  # print "Formatting..."
  # alejandra .;

  git diff -U0 "*.nix" ;
  git add .;

  print "NixOS Rebuilding...";

  sudo nixos-rebuild switch --flake $'($config_dir)#default' | save -f $logfile

  # print $env.LAST_EXIT_CODE

  if $env.LAST_EXIT_CODE != 0 {
    #bat $logfile | grep --color error
    "Failed to Build"
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
