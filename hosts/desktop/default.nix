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
}: let
  inherit (import ./variables.nix) keyboardLayout;
  in {
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ../../modules/nixos
  ];

  environment.systemPackages = (with pkgs; [
    neovim
    kitty
  ]) ++ [
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  powerManagement.cpuFreqGovernor = "performance";

  system.stateVersion = "24.11";
}
