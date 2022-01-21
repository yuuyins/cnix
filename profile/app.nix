{ config, lib, pkgs, ... }:

{

  environment.defaultPackages = with pkgs; [
    curl
    git
    neovim
  ];

}
