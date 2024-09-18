

$env.config = {
  show_banner: false
};


$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.local/bin")
$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.cargo/bin")
$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.yarn/bin")
$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.godot")
$env.PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/node_modules/.bin")

$env.EDITOR = "nvim"
