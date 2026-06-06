{
  pkgs,
  primaryUser,
  ...
}:
{
  networking.hostName = "takemikazuchi";

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
