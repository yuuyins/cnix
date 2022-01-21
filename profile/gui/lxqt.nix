{ config, lib, pkgs, ... }:

{

  services.xserver.desktopManager.lxqt = {
    enable = true;
  };

  environment.lxqt.excludePackage = with pkgs; [
    compton-conf
    xscreensaver
    screengrab
  ];

  home-manager.users.cnix = {
    systemd.user.services = {
      lxqt = {
        Unit = {
          Description = "LXQt";
          Documentation = [ "man:lxqt(5)" ];
          BindsTo = "graphical.target";
          Requires = "graphical.target";
          After = "graphical.target";
        };
        Service = {
          Tye = "simple";
          ExecStart = "${pkgs.lxqt.lxqt-session}/bin/startlxqt";
          Restart = "on-failure";
          RestartSec = "1";
          TimeoutStopSec = "10";
        };
      };
    };
  };

}
