let config_dir = $env.HOME + "/nixos";

export def rebuild []  {
  let logfile = $"($config_dir)/nixos-switch.log";

  print $"Entering ($config_dir)";
  cd $config_dir;


  print "Formatting..."
  alejandra .;

  git diff -U0 "*.nix" ; 
  git add .

  print "NixOS Rebuilding...";

  let output = sudo nixos-rebuild switch --flake $'($config_dir)#(hostname)' | complete 

  echo $output.stdout | save -f $logfile
  echo $output.stderr | save -a $logfile

  if $output.exit_code != 0 {
    open --raw $logfile | grep --color error
    print -e "Failed to Build"
    return 1
  } else {
    let generations = nixos-rebuild list-generations --json | from json

    let current = $generations | where "current" | select generation date | first
    let current_gen = $current | get generation 
    let date = $current | get date 

    let msg = $'Generation ($current_gen): ($date)'
    git commit -m $msg | ignore

    hyprctl reload

    print $"Successfully Built NixOS: '($msg)'"
  }
}

export def upgrade [] {
  cd $config_dir

  print "Updating Flakes:"
  nix flake update 

  if $env.LAST_EXIT_CODE != 0 {
    print -e "Failed to Update"
  } else {
    rebuild
  }
}

alias ns = nix-shell
alias nuns = ns --run nu
alias nudv = nix develop -c nu 
alias numux = nix develop -c tmux 
