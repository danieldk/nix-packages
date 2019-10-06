{ pkgs ? import <nixpkgs> {} }:

rec {
  # Homegrown software
  alpinocorpus = pkgs.callPackage ./pkgs/alpinocorpus {};
  citar = pkgs.callPackage ./pkgs/citar {};
  conllx-utils = pkgs.callPackage ./pkgs/conllx-utils {};
  dact = pkgs.libsForQt5.callPackage ./pkgs/dact { alpinocorpus = alpinocorpus; };

  # Python packages
  pythonPackages = python2Packages;
  python2Packages = python27Packages;
  python3Packages = python37Packages;

  python27Packages = pkgs.recurseIntoAttrs(
    pkgs.python27Packages.callPackage ./pkgs/python-modules {
      inherit alpinocorpus;
    }
  );

  python35Packages = pkgs.python35Packages.callPackage ./pkgs/python-modules {
    inherit alpinocorpus;
  };

  python36Packages = pkgs.python36Packages.callPackage ./pkgs/python-modules {
    inherit alpinocorpus;
  };

  python37Packages = pkgs.recurseIntoAttrs(
    pkgs.python37Packages.callPackage ./pkgs/python-modules {
      inherit alpinocorpus;
    }
  );

  # NLP utilities
  alpino = pkgs.callPackage ./pkgs/alpino {};
  fsa6 = pkgs.callPackage ./pkgs/fsa6 {};
}
