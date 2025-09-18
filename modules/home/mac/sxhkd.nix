{pkgs, ...}: {
  services.skhd = {
    enable = true;

    skhdConfig =
      /*
      config
      */
      ''
        shift + alt - space : \
        yabai -m window --toggle float; \
        yabai -m window --toggle border

        # Restart Yabai
        shift + lctrl + alt - r : \
            /usr/bin/env osascript <<< \
                "display notification \"Restarting Yabai\" with title \"Yabai\""; \
            launchctl kickstart -k "gui/$\{UID}/homebrew.mxcl.yabai"

        # Make window native fullscreen
        alt - f         : yabai -m window --toggle zoom-fullscreen
        shift + alt - f : yabai -m window --toggle native-fullscreen

        yabai -m space --focus <space selector>

        cmd - 2 : yabai -m space --focus 2
      '';
  };
}
