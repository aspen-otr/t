{ config, pkgs, ... }:
let
  HOME = config.home.homeDirectory;
in
{
  home.packages = with pkgs; [
    zip
    unzip
    xz
    p7zip
    bzip2
    zstd

    ripgrep
    fd
    file
    which
    lsof
    cloc

    vim
    neovim

    gnumake
    clang
    clang-tools

    zathura
    zathuraPkgs.zathura_pdf_poppler

    libnotify
    xdg-utils
    xdg-user-dirs
    brightnessctl
    acpi

    go
    nodejs
    rustup

    typst
    tinymist
    typstyle
  ];

  programs = {
    bat.enable = true;
    eza.enable = true;
    git.enable = true;
    imv.enable = true;
    jq.enable = true;
    mpv.enable = true;
  };

  xdg = {
    enable = true;
    cacheHome = HOME + "/.local/cache";

    # configFile."mimeapps.list".force = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;

      desktop = HOME + "/desktop";
      download = HOME + "/downloads";
      documents = HOME + "/documents";
      music = HOME + "/music";
      pictures = HOME + "/pictures";
      projects = HOME + "/code";
      publicShare = HOME + "/public";
      templates = HOME + "/templates";
      videos = HOME + "/videos";

      extraConfig = {
        SCREENSHOT_DIR = "${config.xdg.userDirs.pictures}/screenshots";
      };
    };
  };
}
