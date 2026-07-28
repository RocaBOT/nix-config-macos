{
  pkgs,
  inputs,
  self,
  primaryUser,
  ...
}:
{
  imports = [
    ./settings.nix
    inputs.home-manager.darwinModules.home-manager
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowInsecurePredicate = x: builtins.elem x.pname [ "librewolf" "librewolf-unwrapped" ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${primaryUser} = {
      imports = [ ../home ];
    };
    extraSpecialArgs = {
      inherit inputs self primaryUser;
    };
  };

  system.primaryUser = primaryUser;
  users.users.${primaryUser} = {
    home = "/Users/homura";
  };
  environment = {
    pathsToLink = [ "/Applications" ];
  };
}
