{ ... }:
{
  programs = {
    ghostty = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = {
        font-family = "Agave Nerd Font Mono";
        font-size = 21;
        cursor-style = "bar";
        theme = "ephemeral";
      };

      themes = {
        ephemeral = {
          background = "323F4E";
          foreground = "F8F8F2";
          cursor-color = "87DFEB";
          cursor-text = "323F4E";
          selection-background = "1E262D";
          selection-foreground= "F8F8F2";

          palette = [
            "0=181E26"
            "1=F48FB1"
            "2=53E2AE"
            "3=F1FA8C"
            "4=92B6F4"
            "5=BD99FF"
            "6=79E6F3"
            "7=EBEDEF"
            "8=181E26"
            "9=F48FB1"
            "10=53E2AE"
            "11=F1FA8C"
            "12=92B6F4"
            "13=BD99FF"
            "14=79E6F3"
            "15=EBEDEF"
          ];
        };
      };
    };
  };
}
