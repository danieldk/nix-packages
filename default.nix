{ pkgs ? import <nixpkgs> {} }:

rec {
  # Homegrown software
  alpinocorpus = pkgs.callPackage ./alpinocorpus {};
  citar = pkgs.callPackage ./citar {};
  conllx-utils = pkgs.callPackage ./conllx-utils {};
  dact = pkgs.callPackage ./dact { alpinocorpus = alpinocorpus; };
  sticker = pkgs.callPackage ./sticker { libtensorflow = libtensorflow_1_13_1; };

  # NLP utilities
  fsa6 = pkgs.callPackage ./fsa6 {};

  # Pinned library versions
  libtensorflow_1_13_1 = pkgs.callPackage ./libtensorflow {};
}
