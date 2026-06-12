{
  description = "NCAM (NixOS Configurations for Aspen's Machines)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowc = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, mangowc, ... } @ inputs:
  let
    inherit (nixpkgs) lib;
  in
  {
    nixosConfigurations = {
      corvid = let
        username = "aspen";
        specialArgs = { inherit username; };
      in
        lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            ./hosts/corvid
            mangowc.nixosModules.mango

            home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "bak.hm";
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./user/${username};
            }
          ];
        };
    };
  };
}
