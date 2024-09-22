{ config, pkgs, ... }:

{
  home = {
    stateVersion = "24.05";
    username = builtins.getEnv "USER";
    homeDirectory = builtins.getEnv "HOME";

    file = {
      # TODO: Remove it when hunspell was fixed.
      "Library/Spelling".source = ~/.nix-profile/share/hunspell;
    };

    packages = with pkgs; [
      aria2
      bat
      curl
      diffutils
      findutils
      fontconfig
      gnugrep
      hunspell
      hunspellDicts.en-us
      iputils
      iproute2
      openssh
      procps
      tree

      libvterm

      mpv

      bzip2
      gzip
      xz
      zip
      unzip
      zstd

      clang
      clang-tools
      cmake
      gnumake
      libtool

      python3

      racket

      cargo
      rustc
      rustfmt
      rust-analyzer

      typst
    ];
  };

  programs = {
    git = {
      enable = true;
      userName = "E-Neo";
      userEmail = "e-neo@qq.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    home-manager.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "ys";
      };
    };
  };
}
