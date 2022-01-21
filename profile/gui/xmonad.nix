{ config, lib, pkgs, ... }:

{

  services.xserver = {
    displayManager = {
      startx.enable = true;
      defaultSession = "none+xmonad";
    };
  };

  home-manager.users.cnix = {
    # nix-shell -p 'haskellPackages.ghcWithPackages (pkgs: with pkgs; [xmonad])' --command ghci
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmobar
      ];
    };
  };

}
