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
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "CascadiaCode" "CascadiaMono" ]; })
    noto-fonts
    fira-code
    jetbrains-mono
    font-awesome
    terminus_font
  ];
}
