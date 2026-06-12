{ pkgs, username, ... }:
{
  home.packages = with pkgs.emacsPackages; [
    # TODO Fillout
  ];

  programs.emacs.enable = true;
  services.emacs = {
    enable = true;
    startWithUserSession = true;
    # defaultEditor = true; XXX: See if we can determine if an emacs/${username} dir exists.
  };
}
