{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {   # "nixos" = your hostname
      modules = [
        ./configuration.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-t480     # ← your model
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.teresascav = import ./home.nix;
        }
      ];
    };
  };
}
