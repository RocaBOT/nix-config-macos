{ primaryUser, ... }:
{
  programs.git = {
    enable = true;

    lfs.enable = true;

    ignores = [ "**/.DS_STORE" ];

    settings = {
      user.name = "Homura";
      user.email = "julia@datarac.es";
      github = {
        user = "RocaBOT";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
