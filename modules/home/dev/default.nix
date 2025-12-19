{config, ...}: {
  imports = [
    ./editors.nix
    ./nvim.nix
    ./compilers.nix
    ./git.nix
  ];
  home.file.".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink ./ideavimrc.vim;
}
