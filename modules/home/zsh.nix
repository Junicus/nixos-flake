{ hostname, config, pkgs, host, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-flake/#${host}";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
