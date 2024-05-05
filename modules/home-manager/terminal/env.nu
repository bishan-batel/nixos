

$env.config = {
  show_banner: false
};


$env.PATH = ($env.PATH | prepend $"($env.HOME)/.cargo/bin");
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.yarn/bin");

# vim: ft=nu
