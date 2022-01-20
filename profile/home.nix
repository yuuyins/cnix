{ config, lib, pkgs, ... }:

{

  home-manager.users.cnix = {
    home = {
      packages = with pkgs; [
        git
        lf
        pcmanfm-qt
      ];
    };
  };

}
