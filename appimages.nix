{ pkgs ? import (import ./nix/sources.nix).nixpkgs {} }:

let
  sources = import nix/sources.nix;
  danieldk = pkgs.callPackage ./default.nix { };
  appimage = import "${sources.nix-bundle}/appimage-top.nix" {
    nixpkgs' = sources.nixpkgs;
  };
in {
  alpino = appimage.appimage (appimage.appdir {
    name = "alpino";
    target = danieldk.alpino;
  });
}
