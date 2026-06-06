{ self, ... }:
{
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 7;
    configurationRevision = self.rev or self.dirtyRev or null;

    startup.chime = false;

    defaults = {
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };

      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      NSGlobalDomain = {
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
	"com.apple.mouse.tapBehavior" = 1;
      };

      magicmouse = {
        MouseButtonMode = "TwoButton";
      };
    };
  };
}
