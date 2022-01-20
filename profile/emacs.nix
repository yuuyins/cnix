{ config, lib, pkgs, inputs, ... }:

{

  nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];

  home-manager.users.cnix = {
    enable = true;
    programs.emacs.package = pkgs.emacsPgtk;
  };

}
