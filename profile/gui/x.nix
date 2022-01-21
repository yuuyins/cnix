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
    };
  };

  fonts.fonts = with pkgs; [
    font-awesome
    iosevka-fixed-bin
    material-icons
    opensans-ttf
    twemoji-color-font
    cm_unicode
  ];

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