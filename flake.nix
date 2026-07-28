{
  description = "Homura's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-patcher.url = "github:gepbird/nixpkgs-patcher";

    # nixpkgs-patch-librewolf-152-0 = {
    #   url = "https://github.com/NixOS/nixpkgs/commit/4fb676193ca9cc8662c2cb87f7e4339360472b18.diff?full_index=1";
    #   flake = false;
    # };
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs-patcher,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      primaryUser = "homura";
      host = "fuxi";
    in
    {
      darwinConfigurations.${host} = nixpkgs-patcher.lib.darwinSystem {
        system = "aarch64-darwin";
        nixpkgsPatcher.nixpkgs = nixpkgs;
        nixpkgsPatcher.nix-darwin = nix-darwin;
        modules = [
          ./darwin
          ./hosts/${host}/configuration.nix
        ];
        specialArgs = { inherit inputs self primaryUser; };
        nixpkgsPatcher.inputs = inputs;
      };
    };
}
