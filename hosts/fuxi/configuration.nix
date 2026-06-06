{
  pkgs,
  primaryUser,
  ...
}:
{
  networking.hostName = "fuxi";

  home-manager.users.${primaryUser} = {
    home.packages = with pkgs; [
      # host specific packages
    ];

    programs = {
      zsh = {
        initContent = ''
          source ${./shell-functions.sh}
        '';
      };
    };
  };
}