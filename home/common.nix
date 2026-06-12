{ config, pkgs, ... }:
let
  userhome = config.home.homeDirectory;
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
    cacheHome = userhome + "/.local/cache";

    # configFile."mimeapps.list".force = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;

      desktop = userhome + "/desktop";
      download = userhome + "/downloads";
      documents = userhome + "/documents";
      music = userhome + "/music";
      pictures = userhome + "/pictures";
      projects = userhome + "/code";
      publicShare = userhome + "/public";
      templates = userhome + "/templates";
      videos = userhome + "/videos";

      extraConfig = {
        SCREENSHOT_DIR = "${config.xdg.userDirs.pictures}/screenshots";
      };
    };
  };
}
