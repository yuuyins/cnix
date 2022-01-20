{ config, lib, pkgs, ... }:

{

  home-manager.users.cnix = {
    home = {
      packages = with pkgs; [
        neovim
        git
        lf
        pcmanfm-qt
      ];
    };
  };

}
