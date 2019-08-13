{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, darwin }:

let
  src = fetchFromGitHub {
    owner = "finalfusion";
    repo = "finalfusion-utils";
    rev = "0.8.1";
    sha256 = "09gijjfx661p8yxq4bzjmchsjf1r9yb25zlq1isksffy4i8f57lf";
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
