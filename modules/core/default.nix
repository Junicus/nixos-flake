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
  imports = [
    ./bootloader.nix
    ./network.nix
    ./audio.nix
    ./fonts.nix
    ./locale.nix
    ./stylix.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./nix.nix
  ];
}
