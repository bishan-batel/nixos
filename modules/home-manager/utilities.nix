{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    gimp
    obsidian
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
