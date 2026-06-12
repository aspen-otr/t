{ config, pkgs, username, ... }:
{
  programs = {
    chromium.enable = true;

    firefox = {
      enable = true;

      configPath = "${config.xdg.configHome}/mozilla/firefox";

      profiles.${username} = {
        name = username;

        search.engines = {
          nix-packages = {
            name = "Nix Packages";
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          # TODO: chess-programming-wiki = {};
        };

        # TODO: extensions = {};
      };
    };
  };
}
