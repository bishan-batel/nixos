

$env.config = {
  show_banner: false
};


$env.PATH = ($env.PATH | prepend $"($env.HOME)/.cargo/bin");
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.yarn/bin");
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.godot");

$env.EDITOR = "nvim"

# vim: ft=nu
