{ primaryUser, ... }:
{
  imports = [
    ./packages.nix
    ./git.nix
    ./shell.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "26.11";
    sessionVariables = {
      # shared environment variables
    };

    file.".hushlogin".text = "";
  };
}
