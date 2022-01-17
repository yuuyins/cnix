{ config, lib, pkgs, ... }:

{

  # nixpkgs = {
  #   config = {
  #     allowBroken = true;
  #     allowUnfree = true;
  #   };
  # };

  nix = {
    package = pkgs.nixFlakes;
    useSandbox = true;
    autoOptimiseStore = true;
    allowedUsers = [ "@wheel" ];
    trustedUsers = [ "@wheel" ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # gc = {
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 7d --max-freed $((64 * 1024**3))";
    # };

    #   optimise = {
    #     automatic = true;
    #     dates = [ "weekly" ];
    #   };
  };

}
