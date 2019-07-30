{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, darwin }:

let
  src = fetchFromGitHub {
    owner = "finalfusion";
    repo = "finalfusion-utils";
    rev = "0.7.0";
    sha256 = "1m9bc6cmkwlr23i89qfv221h3l3d81l0pvn7w8gxwwcpvx71rnpp";
  };
in ((callPackage ./finalfusion-utils.nix {}).finalfusion_utils {}).override {
  crateOverrides = defaultCrateOverrides // {
    finalfusion-utils = attr: {
      inherit src;

      buildInputs = stdenv.lib.optional stdenv.isDarwin darwin.Security;

      postInstall = ''
        rm -rf $out/lib
      '';

      meta = with stdenv.lib; {
        description = "Utilities for finalfusion word embeddings";
        license = licenses.free;
        platforms = platforms.all;
      };
    };

    ndarray = attr: {
      features = [ "default" ];
    };
  };
}
