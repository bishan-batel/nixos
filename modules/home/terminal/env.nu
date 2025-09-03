

$env.config = {
  show_banner: false
};



$env.EDITOR = "nvim"

$env.__NIX_DARWIN_SET_ENVIRONMENT_DONE = 1 

$env.PATH = $env.PATH ++ [
    $"($env.HOME)/.nix-profile/bin"
    $"/etc/profiles/per-user/($env.USER)/bin"
    "/run/current-system/sw/bin"
    "/nix/var/nix/profiles/default/bin"
     $"($env.HOME)/.local/bin"
     $"($env.HOME)/.cargo/bin"
     $"($env.HOME)/.yarn/bin"
     $"($env.HOME)/.godot"
     $"($env.HOME)/node_modules/.bin"
]
