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
      tmux-fzf
    ];

    catppuccin.enable = true;

    extraConfig =
      /*
      tmux
      */
      ''
        set-option -sa terminal-overrides ",xterm*:Tc"
        set -g mouse on

        unbind C-b
        set -g prefix C-Space
        bind C-Space send-prefix

        bind -n M-h previous-window
        bind -n M-l next-window

        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"

        # set-option -g status-position top

        # vim mode
        set-window-option -g mode-keys vi
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      '';
  };
}
