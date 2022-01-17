{ config, lib, pkgs, ... }:

{

  home-manager.users.cnix = {
    wayland.windowManager.sway = {
      enable = true;
      systemdIntegration = true;
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

    programs = {
      alacritty = {
        enable = true;
      };
    };

    home.packages = with pkgs; [
      wofi
      wl-clipboard
    ];
  };

}
