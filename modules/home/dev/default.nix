{config, ...}: {
  imports = [
    ./editors.nix
    ./nvim.nix
    ./compilers.nix
    ./git.nix
    ./game.nix
    ./humiliation.nix
  ];
  home.file.".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink ./ideavimrc.vim;
}
