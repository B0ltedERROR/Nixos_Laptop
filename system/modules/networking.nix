{ config, pkgs, ... }:

{
  networking = {
	hostName = "b0lt";
	networkmanager.enable = true;
	enableIPv6 = false;
	firewall.enable = false;
  };
}
