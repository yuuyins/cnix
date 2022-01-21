{ config, lib, pkgs, ... }:

let
  iosevka-fixed-bin = pkgs.iosevka-bin.overrideAttrs (oldAttrs: rec {
    name = "sgr-iosevka-fixed";
    version = "10.0.0";
    src = builtins.fetchurl {
      url = "https://github.com/be5invis/Iosevka/releases/download/v${version}/ttc-${name}-${version}.zip";
      sha256 = lib.fakeSha256;
    };
  });
in
{
  home-manager.users.cnix = {
    home.packages = with pkgs; [
      font-awesome
      iosevka
      # iosevka-fixed-bin
      material-icons
      opensans-ttf
      twemoji-color-font
      cm_unicode
    ];
  };
}
