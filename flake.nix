{
  description = "Junicus Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix/release-24.11";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager, 
    ... 
  } @ inputs: 
  let
    system = "x86_64-linux";
    username = "junicus";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    }; 
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      irsi1 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
	  ./hosts/irsi1
	  inputs.stylix.nixosModules.stylix
	  inputs.catppuccin.nixosModules.catppuccin
	];
	specialArgs = { host = "irsi1"; inherit self inputs username; };
      };
    };
  };
}
