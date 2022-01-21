{ config, lib, pkgs, ... }:

{

  networking = {
    hostName = "cnix";
    dhcpcd.enable = false;
    networkmanager.enable = false;

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    # networking.interfaces.enp1s0.useDHCP = true;

    useNetworkd = true;

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    firewall = {
      enable = true;
    };
  };

  systemd = {
    # network.enable = true; # this vs networking.useNetworkd?
    services."systemd-networkd-wait-online".enable = false;

    network.networks = {
      "20-wired" = {
        enable = true;

        matchConfig = {
          MACAddress = "52:54:00:9c:be:b7";
          Type = "ether";
        };

        DHCP = "yes";

        dhcpV4Config = {
          RouteMetric = 10;
        };
      };
    };
  };

  services = {
    dnsmasq.enable = false;

    resolved = {
      enable = true;

      # https://bbs.archlinux.org/viewtopic.php?id=240427
      # https://github.com/systemd/systemd/issues/13432
      dnssec = "false";
    };
  };

  programs = {
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    mtr = {
      enable = true;
    };
  };

}
