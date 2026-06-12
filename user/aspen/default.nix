{ ... }:
{
  imports = [
    ../../home/core.nix
    ../../home/common.nix
    ../../home/term.nix
    ../../home/browser.nix
    ../../home/music.nix

    ../../home/wayland.nix
    ../../home/mango
    ../../home/emacs
    ../../home/shell/zsh.nix
  ];

  programs.git.settings = {
    user.name = "Aspen Price";
    user.email = "aspen@aspen-otr.com";
  };
}
