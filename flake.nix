{
	description = "NixOS Setup";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows="nixpkgs-unstable";
    };

    # QML plugin for niri
    qml-qiri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows="nixpkgs-unstable";
      inputs.quickshell.follows = "quickshell";
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
