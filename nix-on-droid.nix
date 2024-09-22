{ config, lib, pkgs, ... }:

let
  terminalFont = "${pkgs.nerdfonts.override {
    fonts = [ "Hack" ];
  }}/share/fonts/truetype/NerdFonts/HackNerdFontMono-Regular.ttf";
in
{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    emacs # or some other editor, e.g. nano or neovim

    # Some common stuff that people expect to have
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nix.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];

  time.timeZone = "Asia/Shanghai";

  terminal.font = terminalFont;

  user.shell = "${pkgs.zsh}/bin/zsh";

  home-manager.config = ./home.nix;
}
