{pkgs, ...}: {
  home.file.".Xresources".text =
    /*
    sh
    */
    ''
      Xft.dpi: 180
    '';
}
