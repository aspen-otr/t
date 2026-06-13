{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awww
    lz4 # awww dep

    wl-clipboard
    hyprpicker

    # utils
    wev
  ];

  services = {
    awww.enable = true;

    fnott = {
      enable = true;
      settings = {
        low = {
          timeout = 5;
        };
      };
    };

    wlsunset = {
      enable = true;
      latitude = 43.0;
      longitude = -89.4;
    };
  };

  programs.waybar.enable = false;
}
