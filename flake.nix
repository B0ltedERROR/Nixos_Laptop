{
    description = "gpskwlkr NixOS";

    inputs = {
	    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    };

    outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
	let 
	    lib = nixpkgs.lib;
	    system = "x86_64-linux";
	    pkgs = nixpkgs.legacyPackages.${system};
            pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in
    {
		nixosConfigurations.b0lt = lib.nixosSystem {
                inherit system;
				modules = [
                    ./system/configuration.nix 
				];
                specialArgs = {
                    inherit pkgs-unstable;
                };
        };

    };
}
