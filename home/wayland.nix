{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lz4 # awww dep

    wl-clipboard
    hyprpicker

    # utils
    wev
  ];

  services = {
    awww.enable = true;
    fnott.enable = true;

    wlsunset = {
      enable = true;
      latitude = 43.0;
      longitude = -89.4;
    };
  };

  programs.waybar.enable = false;
}
