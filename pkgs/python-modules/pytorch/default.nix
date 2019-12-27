{ callPackage, lib, cudaSupport, mklSupport, magma }:

let
  createDerivation = { version, sha256 }: {
    # Convert a version such as "1.3.1" to the attribute "v1_3_1".
    name = "v${builtins.replaceStrings ["."] ["_"] version}";
    value = callPackage ./generic.nix { inherit version sha256 cudaSupport mklSupport magma; };
  };
  versions = import ./versions.nix;
in builtins.listToAttrs (map createDerivation versions)
