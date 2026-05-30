{
	description = "NixOS Setup";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};


  outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
  let
    pkgs-unstable = import inputs.nixpkgs-unstable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs pkgs-unstable; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.kavin = import ./home.nix;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs pkgs-unstable; };
          };
        }
      ];
    };
  };
}
