{ pkgs ? import <nixpkgs> {} }:

{
  # Homegrown software
  alpinocorpus = pkgs.callPackage ./alpinocorpus {};
  citar = pkgs.callPackage ./citar {};

  # NLP utilities
  fsa6 = pkgs.callPackage ./fsa6 {};
}
