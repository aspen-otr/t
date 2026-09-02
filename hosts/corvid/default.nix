{ pkgs, username, ... }:
{
  imports =
    [
      ../../system.nix
      ../../home/dm/gdm.nix
      ./hardware-configuration.nix
    ];

  users.users.${username} = { # Corvid always has this.
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  programs.mango.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = "nix-command flakes";

  networking.hostName = "corvid";
  networking.hosts = {
    "127.0.0.1" = [
      "me"
      "api.localhost"
      "admin.localhost"
    ];
  };

  time.timeZone = "America/Chicago";

  networking.firewall.enable = false;

  services.displayManager.ly.settings.battery_id = "BAT1";

  system.stateVersion = "25.11";
}
