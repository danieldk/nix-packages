{ pkgs, callPackage, alpinocorpus, python }:

let
  disabledIf = x: drv:
    if x then throw "${drv.pname or drv.name} not supported for interpreter ${python.executable}" else drv;
in {
  alpino-tokenizer = disabledIf (!python.isPy3k) (callPackage ./alpino-tokenizer {});

  alpinocorpus = callPackage ./alpinocorpus {
    inherit alpinocorpus;
  };

  pytorch = let
    mklSupport = pkgs.config.mklSupport or false;
    pythonBlas = python.override {
      packageOverrides = self: super: {
        numpy = (super.numpy.override {
          blas = if mklSupport then pkgs.mkl else pkgs.openblasCompat;
        });
      };
    };
  in pythonBlas.pkgs.callPackage ./pytorch rec {
    inherit mklSupport;

    cudaSupport = pkgs.config.cudaSupport or false;

    magma = pkgs.magma.overrideAttrs (attrs: rec {
      preConfigure = ''
        export CC=${pkgs.cudatoolkit.cc}/bin/gcc CXX=${pkgs.cudatoolkit.cc}/bin/g++
      '';
    });
  };

  somajo = callPackage ./somajo {};
}
