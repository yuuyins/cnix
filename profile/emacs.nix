{ config, lib, pkgs, inputs, ... }:

{

  # nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];

  home-manager.users.cnix.programs.emacs = {
    enable = true;
    # package = pkgs.emacsPgtk;
  };

}
