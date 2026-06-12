{ config, ... }:
{
  programs.rmpc.enable = true;
  services.mpd = {
    enable = true;
    musicDirectory = "${config.xdg.userDirs.music}";
    extraConfig = ''
      db_file "${config.xdg.dataHome}/mpd_db"
      sticker_file "${config.xdg.dataHome}/mpd_sticker.sql"
      state_file "${config.xdg.cacheHome}/mpd_state"
      playlist_directory "${config.xdg.dataHome}/playlists"

      audio_output {
        type "pipewire"
        name "Piped Wire"
      }
    '';
  };
}
