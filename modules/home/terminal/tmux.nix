{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell}/bin/nu";
    terminal = "tmux-256color";
    historyLimit = 1000;
    plugins = with pkgs.tmuxPlugins; [
      yank
      sensible
      vim-tmux-navigator
    ];

    extraConfig =
      /*
      tmux
      */
      ''
        unbind C-b
        set -g prefix C-Space
        bind C-Space send-prefix

        set -g mouse on


        # set-option -g status-position top

        # vim mode
        set-window-option -g mode-keys vi
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

        bind -n M-H previous-window
        bind -n M-L next-window


        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
      '';
  };
}
