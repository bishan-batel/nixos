{
  pkgs,
  libs,
  ...
}: {
  home.file.".ideavimrc" = libs.mkOutOfStoreSymlink ./.ideavimrc;
}
