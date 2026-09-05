{ pkgs, ... }: let 
  trenchbroom = pkgs.appimageTools.wrapType2 rec {
    pname = "TrenchBroom";
    version = "v2025.3";

    src = "${pkgs.fetchzip {
      url = "https://github.com/TrenchBroom/TrenchBroom/releases/download/${version}/TrenchBroom-Linux-x86_64-${version}-Release.zip";
      hash = "sha256-lv5DPpZhAV/xFxtcl7uqHShgWKRolY6SG8mhrR6955Y=";
    }}/TrenchBroom.AppImage";
  }; in {
  home.packages = [ trenchbroom ];
}
