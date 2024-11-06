{ config, pkgs, ... }:

let
  emacsPackages = with pkgs.emacsPackages; [
    amx
    async
    browse-kill-ring
    cider
    clojure-mode
    conda
    cypher-mode
    company
    company-maxima
    company-quickhelp
    counsel
    delight
    diff-hl
    dockerfile-mode
    doom-themes
    doom-modeline
    eldoc
    elpa-mirror
    emms
    erlang
    exec-path-from-shell
    geiser-guile
    go-mode
    grip-mode
    highlight-escape-sequences
    highlight-indent-guides
    ivy
    lua-mode
    magit
    markdown-mode
    maxima
    nerd-icons-dired
    nix-mode
    undo-tree
    org-ref
    proof-general
    racket-mode
    rainbow-delimiters
    rainbow-mode
    rust-mode
    switch-window
    texfrag
    tuareg
    typescript-mode
    utop
    vterm
    whitespace-cleanup-mode
    windresize
    yaml-mode
    yasnippet
  ];
in
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
    ] ++ emacsPackages;
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
