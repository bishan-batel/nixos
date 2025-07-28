{pkgs, ...}: {
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 15d";
    };

    optimise = {
      automatic = true;
    };
  };
}
