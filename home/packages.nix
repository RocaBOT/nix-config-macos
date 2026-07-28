{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      curl
      neovim
      htop
      tree
      yt-dlp
      nixfmt
      ffmpeg
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      librewolf
      # freetube # currently broken
      keepassxc
      iterm2
      vscodium
      mpv
      signal-desktop
    ];
  };
}
