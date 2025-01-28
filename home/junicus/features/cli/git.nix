{
  pkgs,
  config,
  lib,
  ...
}: let

in {
  programs.git = {
    enable = true;
    userName = "Nelson Segarra";
    userEmail = "junicus@outlook.com";
  }
}
