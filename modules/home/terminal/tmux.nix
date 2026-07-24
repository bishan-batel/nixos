{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell.outPath}/bin/nu";
    terminal = "tmux-256color";
    historyLimit = 10000;
    shortcut = "Space";
    keyMode = "vi";

    plugins = with pkgs; [
      tmuxPlugins.sensible
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
      tmuxPlugins.continuum
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-fzf

      tmuxPlugins.battery
      tmuxPlugins.cpu
    ];

    extraConfig =
      /*
      tmux
      */
      ''
        set-option -sa terminal-overrides ",xterm*:Tc"
        set -g mouse on

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

        set -g default-command "${pkgs.nushell.outPath}/bin/nu";
        # set-option -g default-command "reattach-to-user-namespace -l ${pkgs.nushell.outPath}/bin/nu"
      '';
    # set-option -g default-command "reattach-to-user-namespace -l nu"
  };

  catppuccin.tmux = {
    enable = true;
    extraConfig =
      /*
      tmux
      */
      ''
        set -g @catppuccin_flavor "mocha"
        set -g @catppuccin_window_status_style "basic"

        set -ogq @catppuccin_pane_default_fill "number"
        set -ogq @catppuccin_pane_number_position "left" # right, left

        # Make the status line pretty and add some modules
        set -g status-right-length 100
        set -g status-left-length 100

        # set -g status-left ""
        set -g status-left ""

        set -g status-right "#\{E:@catppuccin_status_application}"
        set -agF status-right "#\{E:@catppuccin_status_cpu}"
        set -ag status-right "#\{E:@catppuccin_status_session}"
        set -ag status-right "#\{E:@catppuccin_status_uptime}"
        set -agF status-right "#\{E:@catppuccin_status_battery}"
      '';
  };
}
