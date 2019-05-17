{ pkgs ? import <nixpkgs> {} }:

{
  # Homegrown software
  citar = pkgs.callPackage ./citar {};

  # NLP utilities
  fsa6 = pkgs.callPackage ./fsa6 {};
}
