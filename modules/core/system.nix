{
  pkgs,
  config,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    eza
  ];

  system.stateVersion = "24.11";
}
