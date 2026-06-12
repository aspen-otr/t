{ config, lib, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format =
        ''
        $directory$git_branch$git_status$status$character
        '';
    };
  };

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    setOptions = [
      "PROMPT_SUBST"
      "EXTENDED_HISTORY"
      "HIST_IGNORE_DUPS"
    ];
    shellAliases = {
      ls = "eza --group-directories-first";
      ll = "eza -a --group-directories-first --long";
      nrs = "sudo nixos-rebuild switch";
    };
    defaultKeymap = "viins";
    initContent = lib.mkOrder 800 ''
      autoload -Uz add-zsh-hook
      autoload -Uz promptinit && promptinit
      function __git_branch() {
        local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
        if [[ -n $branch ]]; then
            echo -n " %F{yellow}($branch)%F{reset_color}"
        fi
      }
      PROMPT='[%n@%m:%F{cyan}%2~%F{reset_color}$(__git_branch)%(?.. %F{red}(%?%)%F{reset_color})]%(!.#.$) '
    '';
  };

  home.stateVersion = "25.11";
}
