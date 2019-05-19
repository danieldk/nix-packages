{ pkgs, stdenv, callPackage, fetchFromGitHub }:

((callPackage ./conllx-utils.nix {}).conllx_utils {}).overrideAttrs (attrs: {
  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "conllx-utils";
    rev = attrs.crateVersion;
    sha256 = "197s67w6mzxqnnmjjprrzkg5lkmy0dgiw8h0y8w1qk70zfwsz4ir";
  };

  preFixup = ''
    mkdir -p "$out/man/man1"
    cp man/*.1 "$out/man/man1/"
  '';

  meta = with stdenv.lib; {
    description = "Utilities for working with CoNLL-X data";
    license = licenses.asl20;
    platforms = platforms.all;
  };
})
