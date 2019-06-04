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
    finalfusion = pkgs.callPackage ./python-modules/finalfusion {
      pythonPackages = pkgs.python27Packages;
    };
  };

  python35Packages = {
    finalfusion = pkgs.callPackage ./python-modules/finalfusion {
      pythonPackages = pkgs.python35Packages;
    };
  };

  python36Packages = {
    finalfusion = pkgs.callPackage ./python-modules/finalfusion {
      pythonPackages = pkgs.python36Packages;
    };
  };

  python37Packages = {
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
