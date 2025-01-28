{
  inputs,
  lib,
  pkgs,
  config,
  outputs,
  ...
}: {
  imports = [
    ../features/cli
  ];
  ++ (builtins.attrValues outputs.homeManagerModules);

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
	"flakes"
      ];
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
  };
}
