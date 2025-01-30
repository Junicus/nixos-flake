{
  pkgs,
  config,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}: {
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.image = ../../wallpapers/wall2.jpeg;
  stylix.targets.gtk.enable = true;
  stylix =  {
    fonts = {
      sizes = {
        terminal = 14;
	applications = 12;
	popups = 12;
      };

      serif = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
	name = "JetBrainsMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
	name = "JetBrainsMono Nerd Font";
      };

      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
	name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
	name = "Noto Color Emoji";
      };
    };
  };
  stylix.polarity = "dark";
}
