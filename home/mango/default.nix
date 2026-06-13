{ mangowc, ... }:
{
  imports = [ mangowc.hmModules.mango ];

  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;

    settings = {
      animations = 0;
      blur = 0;
      borderpx = 2;
      gappih = 5;
      gappiv = 5;
      gappoh = 10;
      gappov = 10;

      cursor_size = 24;

      repeat_rate = 50;
      repeat_delay = 300;
      numlockon = 1;
      trackpad_natural_scrolling = 1;
      enable_hotarea = 0;

      xkb_rules_options = "caps:escape";

      bind = [
        "Super+Shift,r,reload_config"
        "Super+Shift,q,quit"

        "Super+Shift,c,killclient"
        "Super,j,focusstack,next"
        "Super,k,focusstack,prev"
        "Super+Shift,j,exchange_stack_client,next"
        "Super+Shift,k,exchange_stack_client,prev"

        "Super,h,setmfact,-0.05"
        "Super,l,setmfact,+0.05"

        "Super,1,view,1"
        "Super,2,view,2"
        "Super,3,view,3"
        "Super,4,view,4"
        "Super,5,view,5"
        "Super,6,view,6"
        "Super,7,view,7"
        "Super,8,view,8"
        "Super,9,view,9"
        "Super+Shift,1,tagsilent,1"
        "Super+Shift,2,tagsilent,2"
        "Super+Shift,3,tagsilent,3"
        "Super+Shift,4,tagsilent,4"
        "Super+Shift,5,tagsilent,5"
        "Super+Shift,6,tagsilent,6"
        "Super+Shift,7,tagsilent,7"
        "Super+Shift,8,tagsilent,8"
        "Super+Shift,9,tagsilent,9"

        "Super,Return,spawn,ghostty"
        "Super,b,spawn,firefox"
        "Super,e,spawn,emacsclient -c -a emacs"
        "Super,r,spawn,ghostty -e rmpc"

        "None,XF86MonBrightnessUp,spawn,brightnessctl set 5%+"
        "None,XF86MonBrightnessDown,spawn,brightnessctl set 5%-"
        "None,XF86AudioRaiseVolume,spawn,wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+"
        "None,XF86AudioLowerVolume,spawn,wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%-"
        "None,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_SINK@ toggle"

        "None,XF86AudioNext,spawn,rmpc next"
        "None,XF86AudioPrev,spawn,rmpc prev"
        "None,XF86AudioPlay,spawn,rmpc togglepause"
      ];
    };

    autostart_sh = ''
      awww img ~/pictures/wallpapers/current-wallpaper
    '';
  };
}
