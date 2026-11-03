{ pkgs, ... }:
{
  home.stateVersion = "26.05";
  programs.git = {
    enable = true;
    settings.init.defaultBranch = "master";
    settings.user.name = "teresasdev";
    settings.user.email = "te988158@ucf.edu";
  };
}
