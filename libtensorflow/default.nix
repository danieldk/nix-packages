{ stdenv, fetchurl, libtensorflow }:

let
  system =
    if stdenv.isx86_64 then
      if stdenv.isLinux then "linux-x86_64"
      else if stdenv.isDarwin then "darwin-x86_64"
    else unavailable
      else unavailable;
  unavailable = throw "libtensorflow is not available for this platform!";
  pkgs_stable = import (builtins.fetchTarball {
    name = "nixpkgs-stable-2019-05-18";
    url = https://github.com/nixos/nixpkgs/archive/c86f09d2d939f0f6993447117f841f19242500c2.tar.gz;
    sha256 = "0fvxn8w368wg8d0lgbmrkr3ws1i1484hjrzsr65y4wldz0w9chrq";
  }) {};
in pkgs_stable.libtensorflow.overrideAttrs (oldAttrs: rec {
  pname = "libtensorflow";
  name = "${pname}-${version}";
  version = "1.13.1";

  src = fetchurl {
    url = "https://storage.googleapis.com/tensorflow/${pname}/${pname}-cpu-${system}-${version}.tar.gz";
    sha256 =
      if system == "linux-x86_64" then
        "0cfnpqz1s6ilajg0nfirwbp18f3hls2q8bhn6z032jxn90llhk4k"
      else if system == "darwin-x86_64" then
        "0mv0xrnkb871l6j6gpdq84aq5987sabszggl1jyws4hvacipidmq"
      else unavailable;
  };
})
