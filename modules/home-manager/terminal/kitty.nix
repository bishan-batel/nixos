{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    # font.name = "JetBrainsMono Nerd Font Mono";
    font.name = "agave";
    settings = {
      background_opacity = "0.9";
      confirm_os_window_close = -0;
      copy_on_select = true;
      clipboard_control = "write-clipboard read-clipboard write-primary";
      font_size = 14;
    };

    catppuccin.enable = true;
  };
}
