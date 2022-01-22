{ config, lib, pkgs, ... }:

{

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };

}
