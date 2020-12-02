{ pkgs ? import (import ./nix/sources.nix).nixpkgs {} }:

rec {
  alpinocorpus = pkgs.callPackage ./pkgs/alpinocorpus {};
  alpino-tokenize = pkgs.callPackage ./pkgs/alpino-tokenize {};
  citar = pkgs.callPackage ./pkgs/citar {};
  conllu-utils = pkgs.callPackage ./pkgs/conllu-utils {};
  conllx-utils = pkgs.callPackage ./pkgs/conllx-utils {};
  dact = pkgs.libsForQt5.callPackage ./pkgs/dact { alpinocorpus = alpinocorpus; };

  libtensorflow = pkgs.callPackage ./pkgs/libtensorflow {};

  notion = pkgs.callPackage ./pkgs/notion {};

  # Python packages
  python3Packages = python38Packages;

  python36Packages = pkgs.python36Packages.callPackage ./pkgs/python-modules {
    inherit alpinocorpus;
  };

  python37Packages = pkgs.python37Packages.callPackage ./pkgs/python-modules {
    inherit alpinocorpus;
  };

  python38Packages = pkgs.recurseIntoAttrs (
    pkgs.python38Packages.callPackage ./pkgs/python-modules {
      inherit alpinocorpus;
    }
  );

  # NLP utilities
  alpino = pkgs.callPackage ./pkgs/alpino {};
  fsa6 = pkgs.callPackage ./pkgs/fsa6 {};
}
