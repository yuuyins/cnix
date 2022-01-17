{ config, lib, pkgs, ... }:

{

  home-manager.users.cnix = {
    home = {
      packages = with pkgs; [
        emacs
        git
        lf
        pcmanfm-qt
      ];
    };
  };

}
