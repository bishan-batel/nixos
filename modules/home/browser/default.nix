{pkgs, ...}: {
  programs.firefox = {
    enable = true;
  };

  home.packages = with pkgs; [fx_cast_bridge];
  # services.fx_cast_bridge.enable = true;
}
