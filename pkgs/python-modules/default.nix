{ pkgs, callPackage, alpinocorpus, python, rustNightly }:

let
  disabledIf = x: drv:
    if x then throw "${drv.pname or drv.name} not supported for interpreter ${python.executable}" else drv;
in {
  alpino-tokenizer = disabledIf (!python.isPy3k) (callPackage ./alpino-tokenizer {
    inherit rustNightly;
  });

  alpinocorpus = callPackage ./alpinocorpus {
    inherit alpinocorpus;
  };

  pytorch = callPackage ./pytorch {
    cudaSupport = pkgs.config.cudaSupport or false;

    magma = pkgs.magma.overrideAttrs (attrs: rec {
      preConfigure = ''
        export CC=${pkgs.cudatoolkit.cc}/bin/gcc CXX=${pkgs.cudatoolkit.cc}/bin/g++
      '';
    });
  };

  somajo = callPackage ./somajo {};
}
