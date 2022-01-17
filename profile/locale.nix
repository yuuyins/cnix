{ config, lib, pkgs, ... }:

{

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      # LANG="en_US.UTF-8";
      # LANGUAGE=en_US:en;
      LC_MEASUREMENT="pt_BR.UTF-8";
      LC_PAPER="pt_BR.UTF-8";
      LC_TIME="en_DK.UTF-8";
      LC_CTYPE="pt_BR.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

}
