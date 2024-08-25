{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell}/bin/nu";
    terminal = "tmux-256color";
    historyLimit = 1000;
    # plugins = with pkgs; [ ];
  };
}
