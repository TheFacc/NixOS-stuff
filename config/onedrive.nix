{ config, pkgs, ... }:

let
  username = "facc";
in
{
  users.users.${username}.packages = with pkgs; [
    onedrive
  ];
  services.onedrive = {
    enable = true;
    package = pkgs.onedrive;
  };
  systemd.services.onedrive.serviceConfig = {
    ExecStart = "${pkgs.onedrive}/bin/onedrive --monitor --monitor-interval 60 --confdir ${config.users.users.${username}.home}/.config/onedrive";    
  };
}

