{ pkgs, inputs, username, host, system, lib, ...}:
let
  inherit (import ./variables.nix) gitUsername;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {
      inherit inputs username host;
    };

    users."junicus" = {
      home.username = "junicus";
      home.homeDirectory = "/home/junicus";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };

  users = {
    users."junicus" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
	"video"
	"input"
	"audio"
      ];

      packages = with pkgs; [
      ];
    };
    defaultUserShell = pkgs.zsh;
  };


  nix.settings.allowed-users = ["junicus"];
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
  programs = {
  };
}
