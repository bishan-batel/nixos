{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    gimp
    obsidian
    sway-contrib.grimshot
  ];

  programs = {
    btop = {
      enable = true;

      settings = {
        vim_keys = true;
        rounded_corners = true;
      };

      catppuccin.enable = true;
    };
  };
}
