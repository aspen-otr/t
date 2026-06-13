{ config, pkgs, username, ... }:
{
  programs = {
    chromium.enable = true;

    firefox = {
      enable = true;

      configPath = "${config.xdg.configHome}/mozilla/firefox";


      policies = {
        BlockAboutConfig = false;
        DisableFirefoxAccounts = true;
        DisableTelemetry = true;
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            default_area = "menupanel";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
          };

          "{3c9f3c5d-ec80-455f-bd7c-4f2b51a1a4d9}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/{3c9f3c5d-ec80-455f-bd7c-4f2b51a1a4d9}/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };

      profiles.${username} = {
        name = username;

        extensions.force = true;
        search.force = true;
        containersForce = true;

        settings = {
          "extensions.activeThemeId" = "{3c9f3c5d-ec80-455f-bd7c-4f2b51a1a4d9}";
        };

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
