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

    binaryCaches = [
      "https://nix-community.cachix.org"
    ];
    binaryCachePublicKeys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    requireSignedBinaryCaches = true;

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
