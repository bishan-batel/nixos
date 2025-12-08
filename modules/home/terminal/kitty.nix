{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono";
    settings = {
      shell = "${pkgs.nushell.outPath}/bin/nu";
      background_opacity = "0.94";
      confirm_os_window_close = 0;
      copy_on_select = true;
      clipboard_control = "write-clipboard read-clipboard write-primary";
      font_size = 15;
      cursor_shape = "block";
      cursor_trail_enabled = true;
      # cursor_trail = 50;
      cursor_trail = 2;
      cursor_trail_start_threshold = 2;
      cursor_trail_decay = "0.01 0.4";
      # cursor_trail_start_threshold = 0;
      # cursor_trail_decay = 0.5;
    };
  };
}
