{pkgs, ...}: {
  services.skhd = {
    enable = true;

    skhdConfig = ''
      cmd + shift - return: open -n -a Ghosttty

      fn - 1 : yabai -m space --focus 1
      fn - 2 : yabai -m space --focus 2
      fn - 3 : yabai -m space --focus 3
      fn - 4 : yabai -m space --focus 4
      fn - 5 : yabai -m space --focus 5
      fn - 6 : yabai -m space --focus 6
      fn - 7 : yabai -m space --focus 7
      fn - 8 : yabai -m space --focus 8
      fn - 9 : yabai -m space --focus 9
      fn - 10 : yabai -m space --focus 10
    '';
  };
}
