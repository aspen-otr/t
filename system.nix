{ pkgs, lib, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel" "video" "audio"];
  };

  nix.settings = {
    trusted-users = [username];

    experimental-features = "nix-command flakes";
  };

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    libinput.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
  };

  fonts.packages = [pkgs.symbola]
                   ++ builtins.filter lib.attrsets.isDerivation
                     (builtins.attrValues pkgs.nerd-fonts);
  fonts.enableDefaultPackages = false;

  programs.dconf.enable = true;

  hardware = {
    graphics.enable = true;
  };

  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
  ];
}
