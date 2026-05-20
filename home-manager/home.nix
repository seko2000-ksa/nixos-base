{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  # Standard .config/directory
  configs = {
    qtile = "qtile";
    nvim = "nvim";
    rofi = "rofi";
    alacritty = "alacritty";
    picom = "picom";
  };
in

{
  home.username = "ksa";
  home.homeDirectory = "/home/ksa";
  programs.git.enable = true;
  home.stateVersion = "25.11";

  #xdg.configFile = builtins.mapAttrs
  #  (name: subpath: {
  #    source = create_symlink "${dotfiles}/${subpath}";
  #    recursive = true;
  #  })
  #  configs;

  home.packages = with pkgs; [
  ];

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/Images";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
