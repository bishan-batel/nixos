{ pkgs, ... }: {


  services.sxkhd = {
    enable = true;

    keybindings = [
      
      "shift + alt - space" = /* bash */ ''
        yabai -m window --toggle float; 
        yabai -m window --toggle border
      ''
    ];
  };
}
