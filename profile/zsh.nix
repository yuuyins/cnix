{ config, lib, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    histSize = 2000;
    ohMyZsh = {
      enable = true;
      theme = "ys";
    };
  };

  home-manager.users.cnix = {
    programs = {
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        enableVteIntegration = true;
        autocd = true;
        defaultKeymap = "emacs";
        oh-my-zsh = {
          enable = true;
          theme = "ys";
        };
      };
    };
  };

}
