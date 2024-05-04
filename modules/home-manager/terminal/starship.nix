{pkgs, ...}: {
  programs = {
    starship = {
      enable = true;
      catppuccin.enable = true;

      settings = {
        format = "$all[$character](bg:surface0 text)($cmd_duration)$directory[](text bg:surface0)[](bold surface0 bg:base_light) ";
        right_format = "([](sapphire)[$git_branch( $git_status)](bg:sapphire)[](sapphire))";

        character = {
          success_symbol = "[](bold peach)[λ](bg:peach bold base)[](bold peach bg:surface0)";
          error_symbol = "[](bold red)[✖](bg:red base)[](bold red bg:surface0)";
        };

        directory = {
          format = "[$path]($style)[$read_only]($read_only_style)";
          # truncation_symbol = ".../";
          style = "bg:surface0 text";
          read_only_style = "bold bg:surface0 red";
        };

        cmd_duration = {
          # format = "[󰚭$duration](bg:surface0 black)[](surface0 bg:surface0)";
          format = "";
        };

        git_branch = {
          style = "bold black bg:sapphire";
          symbol = "";
          format = "[$symbol$branch(:$remote_branch)]($style)";
        };

        git_status = {
          style = "black bg:sapphire bold";
          ahead = "⇡\${count}";
          diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
          behind = "⇣\${count}";
          stashed = "󱝏";
          format = "([\\[$all_status$ahead_behind\\]]($style))";
        };

        python = {
          symbol = " ";
          version_format = "\${major}.\${minor}";
          format = "[\${symbol}\${pyenv_prefix}(\${version} )(\\($virtualenv\\) )]($style)";
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
          command = ''git ls-remote --get-url | str replace "https://github.com/" "gh:" '';
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
