{ pkgs, ... }:
{
  services.displayManager.defaultSession = "mango";
  services.displayManager.gdm = {
    enable = true;
    autoSuspend = true;
  };
}
