{pkgs, ...}:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = "$directory$git_branch$character";
      character = {
        success_symbol = "[](blue)";
        error_symbol = "[](red)";
        vicmd_symbol = "[](green)";
      };
      directory = {
        format = "[]($style)[  $path](bg:#b4befe fg:#1e1e2e)[ ]($style)";
        style = "bg:#1e1e2e fg:#b4befe";
      };
      git_branch = {
        format = "[]($style)[  $branch](bg:#f38ba8 fg:#1e1e2e)[ ]($style)";
        style = "bg:#1e1e2e fg:#f38ba8";
      };
    };
  }
}