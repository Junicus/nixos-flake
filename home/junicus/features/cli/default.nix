{pkgs, ...}: {
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    bottom
    ripgrep
  ];
}
