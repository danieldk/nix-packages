{ pkgs ? import <nixpkgs> {} }:

rec {
  # Homegrown software
  alpinocorpus = pkgs.callPackage ./alpinocorpus {};
  citar = pkgs.callPackage ./citar {};
  dact = pkgs.callPackage ./dact { alpinocorpus = alpinocorpus; };

  # NLP utilities
  fsa6 = pkgs.callPackage ./fsa6 {};
}
