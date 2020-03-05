{ pkgs, callPackage, alpinocorpus, cudatoolkit_10_1, python, rustNightly }:

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
    inherit (pkgs.linuxPackages) nvidia_x11;
    cudatoolkit = cudatoolkit_10_1;
  };

  somajo = callPackage ./somajo {};
}
