{ config, lib, pkgs, ... }:

{

  # Define an user account. Don't forget to set a password with ‘passwd’.
  users.users.cnix = {
    isNormalUser = true;
    createHome = true;
    shell = pkgs.zsh;
    group = "cnix";
    extraGroups = [
      "users"
      "wheel" # for sudo
    ];
    home = "/home/cnix";
  };

}
