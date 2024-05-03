{pkgs, ...}: {
  programs = {
    starship = {
      enable = true;
      catppuccin.enable = true;

      settings = {
        format="$all[$character](bg:base_light)($cmd_duration )$directory[\ue0b4](base_light) ";
        right_format="([\ue0b6](lavender)[$git_branch( $git_status)](bg:lavender)[\ue0b4](lavender))";

      };
    };

    carapace.enable = true;
  };
}
