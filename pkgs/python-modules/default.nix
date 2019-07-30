{ callPackage, alpinocorpus }:

{
  alpinocorpus = callPackage ./alpinocorpus {
    inherit alpinocorpus;
  };

  finalfusion = callPackage ./finalfusion {};

  somajo = callPackage ./somajo {};
}
