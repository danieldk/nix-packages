{ pkgs, callPackage, alpinocorpus, python }:

let
  disabledIf = x: drv:
    if x then throw "${drv.pname or drv.name} not supported for interpreter ${python.executable}" else drv;
in {
  alpino-tokenizer = disabledIf (!python.isPy3k) (callPackage ./alpino-tokenizer {});

  alpinocorpus = callPackage ./alpinocorpus {
    inherit alpinocorpus;
  };
}
