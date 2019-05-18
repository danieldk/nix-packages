{ stdenv, fetchFromGitHub, darwin, pkgconfig, libtensorflow, openssl }:

let
  pkgs_unstable = import (builtins.fetchTarball {
    name = "nixpkgs-stable-2019-05-18";
    url = https://github.com/nixos/nixpkgs/archive/bc9df0f66110039e495b6debe3a6cda4a1bb0fed.tar.gz;
    sha256 = "0y2w259j0vqiwjhjvlbsaqnp1nl2zwz6sbwwhkrqn7k7fmhmxnq1";
  }) {};
in pkgs_unstable.rustPlatform.buildRustPackage rec {
  name = "sticker-${version}";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "sticker";
    rev = "${version}";
    sha256 = "0jn7fllix14fqgq46xnfi5yx0i6b0abwdcv827qzdg5bjnlzjfg3";
  };

  cargoSha256 = "0ivw5jf977iy8g1h7sxk4j537b5fmgh2709pl7r7798kxbw46dlc";

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [ openssl libtensorflow ] ++
    stdenv.lib.optional stdenv.isDarwin darwin.Security;

  meta = with stdenv.lib; {
    description = "Neural sequence labeler";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
