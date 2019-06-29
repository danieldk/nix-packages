{ pkgs ? import <nixpkgs> {} }:

rec {
  # Homegrown software
  alpinocorpus = pkgs.callPackage ./alpinocorpus {};
  citar = pkgs.callPackage ./citar {};
  conllx-utils = pkgs.callPackage ./conllx-utils {};
  dact = pkgs.callPackage ./dact { alpinocorpus = alpinocorpus; };
  finalfrontier = pkgs.callPackage ./finalfrontier {};
  finalfusion-utils = pkgs.callPackage ./finalfusion-utils {};
  sticker = pkgs.callPackage ./sticker { libtensorflow = libtensorflow_1_13_1; };
  stickerModels = pkgs.callPackage ./sticker/models.nix {
    inherit sticker;
  };

  # Python packages
  pythonPackages = python2Packages;
  python2Packages = python27Packages;
  python3Packages = python37Packages;

  python27Packages = {
    alpinocorpus = pkgs.callPackage ./python-modules/alpinocorpus {
      inherit (pkgs.python27Packages) buildPythonPackage;
      inherit alpinocorpus;
    };

    finalfusion = pkgs.callPackage ./python-modules/finalfusion {
      pythonPackages = pkgs.python27Packages;
    };
  };

  python35Packages = {
    alpinocorpus = pkgs.callPackage ./python-modules/alpinocorpus {
      inherit (pkgs.python35Packages) buildPythonPackage;
      inherit alpinocorpus;
    };

    finalfusion = pkgs.callPackage ./python-modules/finalfusion {
      pythonPackages = pkgs.python35Packages;
    };
  };

  python36Packages = {
    alpinocorpus = pkgs.callPackage ./python-modules/alpinocorpus {
      inherit (pkgs.python36Packages) buildPythonPackage;
      inherit alpinocorpus;
    };

    finalfusion = pkgs.callPackage ./python-modules/finalfusion {
      pythonPackages = pkgs.python36Packages;
    };
  };

  python37Packages = {
    alpinocorpus = pkgs.callPackage ./python-modules/alpinocorpus {
      inherit (pkgs.python37Packages) buildPythonPackage;
      inherit alpinocorpus;
    };

    finalfusion = pkgs.callPackage ./python-modules/finalfusion {
      pythonPackages = pkgs.python37Packages;
    };
  };

  # NLP utilities
  fsa6 = pkgs.callPackage ./fsa6 {};

  # Docker images
  dockerImages = pkgs.callPackage ./docker-images {
    inherit stickerModels;
  };

  # Pinned library versions
  libtensorflow_1_13_1 = with pkgs; callPackage ./libtensorflow {
    inherit (linuxPackages) nvidia_x11;
    cudatoolkit = cudatoolkit_10_0;
    cudnn = cudnn_cudatoolkit_10_0;
  };
}
