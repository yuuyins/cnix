{ config, lib, pkgs, ... }:

{

  # https://discourse.nixos.org/t/sway-from-home-manager/8703/2
  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  home-manager.users.cnix = {
    wayland.windowManager.sway = {
      enable = true;
      # systemdIntegration = true;
      wrapperFeatures = {
        gtk = true; # so that gtk works properly
      };
      xwayland = true;
      config = {
        focus.followMouse = "always";
        input = {
          "type:keyboard" = {
            xkb_layout = "br";
            xkb_options = "ctrl:nocaps";
          };
          "type:touchpad" = {
            tap = "enabled";
            natural_scroll = "enabled";
          };
        };
        window.border = 1;
        modifier = "Mod4";
      };
    };

    # systemd.user.services = {
    #   # https://github.com/swaywm/sway/wiki/Systemd-integration#running-sway-itself-as-a---user-service
    #   sway = {
    #     Unit = {
    #       Description = "sway - SirCmpwn's Wayland window manager";
    #       Documentation = [ "man:sway(5)" ];
    #       BindsTo = "graphical-session.target";
    #       Wants = "graphical-session-pre.target";
    #       After = "graphical-session-pre.target";
    #     };
    #     Service = {
    #       Type = "simple";
    #       EnvironmentFile = "-%h/.config/sway/env";
    #       ExecStart = "/usr/bin/sway";
    #       Restart = "on-failure";
    #       RestartSec = "1";
    #       TimeoutStopSec = "10";
    #     };
    #   };
    # };

    home = {
      packages = with pkgs; [
        wofi
        wl-clipboard
      ];
      sessionVariables = {
        WLR_RENDERER_ALLOW_SOFTWARE = 1; # enable sway to run on QEMU/KVM
      };
    };
  };

}
