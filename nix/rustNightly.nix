{ callPackage, fetchFromGitHub, makeRustPlatform }:

# The date of the nighly version to use.
date:

let
  sources = import ./sources.nix;
  mozilla = callPackage "${sources.mozilla}/package-set.nix" {};
  rustNightly = (mozilla.rustChannelOf { inherit date; channel = "nightly"; }).rust;
in makeRustPlatform {
  cargo = rustNightly;
  rustc = rustNightly;
}
