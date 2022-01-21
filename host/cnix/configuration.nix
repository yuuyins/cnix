# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }:

{

  imports =
    [
      ./hardware-configuration.nix

      ../../profile/boot.nix
      ../../profile/emacs.nix
      ../../profile/gui/x.nix
      ../../profile/home.nix
      ../../profile/locale.nix
      ../../profile/network.nix
      ../../profile/nix.nix
      ../../profile/ssh.nix
      ../../profile/system.nix
      ../../profile/zsh.nix

      ../../user/cnix.nix
    ];

}
