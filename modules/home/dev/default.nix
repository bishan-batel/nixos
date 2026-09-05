{config, ...}: {
  imports = [
    ./editors.nix
    ./nvim.nix
    ./compilers.nix
    ./git.nix
    ./game.nix
    ./trenchbroom.nix
  ];
  home.file.".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink ./ideavimrc.vim;
}
