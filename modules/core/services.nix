{
  pkgs,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
	variant = "";
      };
    };
    openssh.enable = true;
    printing.enable = true;
  };
}
