{
  pkgs,
  config,
  inputs,
  options,
  ...
}: {
  networking.hostName = "irsi1";
  networking.networkmanager.enable = true;
  networking.timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
}
