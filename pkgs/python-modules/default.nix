{ callPackage, alpinocorpus }:

{
  alpinocorpus = callPackage ./alpinocorpus {
    inherit alpinocorpus;
  };

  somajo = callPackage ./somajo {};
}
