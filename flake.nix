{
  description = "Junicus Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

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
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      irsi1 = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/irsi1 ];
	specialArgs = { inherit inputs outputs; };
      };
    };

    homeConfigurations = {
      "junicus@irsi1" = home-manager.lib.homeManagerConfiguration {
	pkgs = nixpkgs.legacyPackages.x86_64-linux;
	extraSpecialArgs = { inherit inputs outputs; };
        modules = [ ./home/junicus/irsi1.nix ];
      };
    };
  };
}
