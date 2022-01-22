{ config, lib, pkgs, ... }:

{

  services = {
    openssh = {
      enable = true;
      passwordAuthentication = false;
      permitRootLogin = "no";
      ports = [ 227 ];
      openFirewall = true;
    };

    sshguard = {
      enable = true;
      attack_threshold = 20;
      blocktime = 180;
      detection_time = 3600;
    };
  };

}
