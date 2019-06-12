{ pkgs, stdenv, fetchFromGitHub, makeRustPlatform, pythonPackages, darwin }:

let
  nixpkgs_unstable = import (builtins.fetchTarball {
    name = "nixpkgs-stable-2019-05-18";
    url = https://github.com/nixos/nixpkgs/archive/2a56ea3593aa0702a61313572c2211ef947f4d1f.tar.gz;
    sha256 = "05iggc96f3nmylmdgys8i53kd7vfh546lkyi87qqms6vq8v2fybm";
  }) {};
  mozillaOverlay = fetchFromGitHub {
    owner = "mozilla";
    repo = "nixpkgs-mozilla";
    rev = "9f35c4b09fd44a77227e79ff0c1b4b6a69dff533";
    sha256 = "18h0nvh55b5an4gmlgfbvwbyqj91bklf1zymis6lbdh75571qaz0";
  };
  mozilla = pkgs.callPackage "${mozillaOverlay.out}/package-set.nix" { };
  rustNightly = (mozilla.rustChannelOf { date = "2019-02-07"; channel = "nightly"; }).rust;
  rustPlatform = nixpkgs_unstable.makeRustPlatform {
    cargo = rustNightly;
    rustc = rustNightly;
  };
in
  rustPlatform.buildRustPackage rec {
    pname = "finalfusion";
    version = "0.3.0";

    src = fetchFromGitHub {
      owner = "finalfusion";
      repo = "finalfusion-python";
      rev = version;
      sha256 = "05vmj3sglsx305qna36mipkjx374ry0x1aswzlbzkr9xr7p69ipx";
    };

    cargoSha256 = "1ra3vszs46sf4yr6qwk05q34yccb4jqyp9xp80pkvbhpjd4lx4xf";

    nativeBuildInputs = [ nixpkgs_unstable.pyo3-pack ];

    buildInputs = [ pythonPackages.python ] ++
      stdenv.lib.optional stdenv.isDarwin darwin.Security;

    propagatedBuildInputs = [ pythonPackages.numpy ];

    buildPhase = ''
      pyo3-pack build --release --manylinux off
    '';

    installPhase = ''
      ${pythonPackages.python.pythonForBuild.pkgs.bootstrapped-pip}/bin/pip install \
        target/wheels/*.whl --no-index --prefix=$out --no-cache --build tmpbuild
    '';

    doCheck = false;

    meta = with stdenv.lib; {
      description = "Python module for the finalfusion embedding format";
      license = licenses.asl20;
      platforms = platforms.all;
    };
  }
