{ config, lib, pkgs, ... }:

with lib;

let
  pkg = pkgs.apple-emoji-nix;
in
{
  options = {
    fonts.packages = mkOption {
      type = with types; listOf package;
      default = [];
    };
  };

  config = {
    fonts.packages = [ pkg ];
  };

  nixosModule = {
    config = {
      fonts.packages = [ pkg ];
    };
  };
}