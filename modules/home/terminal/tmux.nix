{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell}/bin/nu";
    terminal = "tmux-256color";
    historyLimit = 10000;

    plugins = with pkgs;
    # yank
    # sensible
    # vim-tmux-navigator
    # tmux-fzf
      [
        tmuxPlugins.sensible
        tmuxPlugins.battery
        tmuxPlugins.cpu
        # must be before continuum edits right status bar
        {
          plugin = tmuxPlugins.catppuccin;
          extraConfig =
            /*
            tmux
            */
            ''
              set -g @catppuccin_flavor "mocha"
              set -g @catppuccin_window_status_style "rounded"

              # Make the status line pretty and add some modules
              set -g status-right-length 100
              set -g status-left-length 100
              set -g status-left ""
              set -g status-right "#{E:@catppuccin_status_application}"
              set -agF status-right "#{E:@catppuccin_status_cpu}"
              set -ag status-right "#{E:@catppuccin_status_session}"
              set -ag status-right "#{E:@catppuccin_status_uptime}"
              set -agF status-right "#{E:@catppuccin_status_battery}"
            '';
        }
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig =
            /*
            tmux
            */
            ''
              set -g @resurrect-strategy-vim 'session'
              set -g @resurrect-strategy-nvim 'session'
              set -g @resurrect-capture-pane-contents 'on'
            '';
        }
        tmuxPlugins.better-mouse-mode
        tmuxPlugins.yank
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.tmux-fzf
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
