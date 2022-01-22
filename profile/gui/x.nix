{ config, lib, pkgs, ... }:

{

  services = {
    xserver = {
      enable = true;

      # https://github.com/NixOS/nixpkgs/issues/19629#issuecomment-368121456
      exportConfiguration = true;

      # Configure keymap in X11
      layout = "br";
      xkbOptions = "ctrl:nocaps";

      # Enable touchpad support.
      libinput = {
        enable = true;
        touchpad = {
          disableWhileTyping = true;
          naturalScrolling = true;
          tapping = true;
        };
      };

      desktopManager = {
        xterm.enable = false;
      };

      displayManager.startx.enable = true;
    };
  };

  home-manager.users.cnix = {
    programs = {
      zsh.profileExtra = ''
      # Autostart X at login.
      #   https://wiki.archlinux.org/index.php/Xinit#Autostart_X_at_login
      if [ -z ''${DISPLAY} ] && [ ''${XDG_VTNR} -eq 1 ]; then
        exec ${pkgs.xorg.xinit}/bin/startx
      fi
      '';
    };
  };

  environment.defaultPackages = with pkgs; [
    breeze-qt5
    gtk3 # for gtk3-widget-tools
    libnotify
    libsForQt5.qtstyleplugin-kvantum
    papirus-icon-theme
    qt5ct
    rofi
    xbindkeys
    xbrightness
    xclip
    xdo
    xdotool
    xorg.xfontsel
    xorg.xkill
    xorg.xrandr
    xsettingsd
    libva-utils
  ];

}
