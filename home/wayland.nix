{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awww
    lz4 # awww dep

    wl-clipboard
    hyprpicker
    fnott

    # utils
    wev
  ];

  services = {
    awww.enable = true;

    wlsunset = {
      enable = true;
      latitude = 43.0;
      longitude = -89.4;
    };
  };

  programs.waybar.enable = false;
}
