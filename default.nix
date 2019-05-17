{ pkgs ? import <nixpkgs> {} }:

{
  citar = pkgs.callPackage ./citar {};
}
