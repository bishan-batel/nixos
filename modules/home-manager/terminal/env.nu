

$env.config = {
  show_banner: false
};


$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.cargo/bin")
$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.yarn/bin")
$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.godot")

$env.EDITOR = "nvim"

# vim: ft=nu
