{ config, lib, pkgs, ... }:

{

  services.xserver.desktopManager.lxqt = {
    enable = true;
  };

  environment.lxqt.excludePackages = with pkgs; [
    lxqt.compton-conf
    lxqt.screengrab
    xscreensaver
  ];

  # home-manager.users.cnix = {
  #   systemd.user.services = {
  #     lxqt = {
  #       Unit = {
  #         Description = "LXQt";
  #         Documentation = [ "man:lxqt(5)" ];
  #         BindsTo = "graphical.target";
  #         Requires = "graphical.target";
  #         After = "graphical.target";
  #       };
  #       Service = {
  #         Tye = "simple";
  #         ExecStart = "${pkgs.lxqt.lxqt-session}/bin/startlxqt";
  #         Restart = "on-failure";
  #         RestartSec = "1";
  #         TimeoutStopSec = "10";
  #       };
  #     };
  #   };
  # };

  home-manager.users."cnix" = {
    home.file.".xinitrc".text = ''
#!/usr/bin/env sh

userresources=''${HOME}/.Xresources
usermodmap=''${HOME}/.Xmodmap
export MANPATH="$(manpath)"

dbus-daemon --session --address="unix:path=/run/user/$(id --user)/bus" &
systemctl --user import-environment DISPLAY XAUTHORITY
systemctl --user start graphical-session.target

# https://wiki.archlinux.org/title/Cursor_themes#X_resources
xrdb .Xresources

# https://github.com/NixOS/nixpkgs/issues/69315
# https://github.com/lxqt/lxqt/wiki/ConfigLaunch#fixing-crashes-for-apps-using-dbus-daemon-common-when-using-lxqt-config-monitor
if [ -d ${pkgs.systemd}/share/factory/etc/X11/xinit/xinitrc.d ] ; then
  for f in ${pkgs.systemd}/share/factory/etc/X11/xinit/xinitrc.d/?*.sh ; do
    echo "LXQT FIX: $f"
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec ${pkgs.lxqt.lxqt-session}/bin/startlxqt
    '';
  };

}
