{pkgs, ...}: {
  programs = {
    starship = {
      enable = true;
      catppuccin.enable = true;

      settings = {
        format = "$all[$character](bg:base_light)($cmd_duration )$directory[\\ue0b4](base_light) ";
        right_format = "([\\ue0b6](lavender)[$git_branch( $git_status)](bg:lavender)[\\ue0b4](lavender))";

        character = {
          success_symbol = "[\ue0b6](bold blue)[●](bg:blue black)[\ue0b4](bold blue bg:base_light)";
          error_symbol = "[\ue0b6](bold red)[✖](bg:red black)[\ue0b4](bold red bg:base_light)";
        };

        directory = {
          format = "[$path]($style)[$read_only]($read_only_style)";
          truncation_symbol = "…/";
          style = "bg:base_light white";
          read_only_style = "bg:base_light peach";
        };

        cmd_duration = {
          format = "[ 󰚭 $duration](bg:green black)[\ue0b4](green bg:base_light)";
        };

        git_branch = {
          style = "bold black bg:lavender";
          symbol = "";
          format = "[$symbol$branch(:$remote_branch)]($style)";
        };

        git_status = {
          style = "black bg:lavender";
          ahead = "⇡\${count}";
          diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
          behind = "⇣\${count}";
          stashed = "󱝏";
          format = "([\[$all_status$ahead_behind\]]($style))";
        };

        python = {
          symbol = " ";
          version_format = "\${major}.\${minor}";
          format = "[\${symbol}\${pyenv_prefix}(\${version} )(\($virtualenv\) )]($style)";
        };

        conda = {
          format = "[$symbol$environment]($style) ";
          symbol = "󱔎 ";
          style = "sapphire";
        };

        hostname = {
          ssh_symbol = "";
          detect_env_vars = ["!TMUX"];
        };

        custom.root = {
          command = "echo -n su";
          when = "test $EUID = 0";
          style = "bold red";
          disabled = false;
        };

        custom.reponame = {
          require_repo = true;
          symbol = " ";
          command = ''
            git ls-remote --get-url | sed 's#.*:\\(.*\\).git#\\1#' '';
          description = "display the directory root of the current repo";
          when = true;
        };

        username = {
          disabled = true;
        };
      };
    };

    carapace.enable = true;
  };
}
