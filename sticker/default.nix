{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, pkgconfig,
  curl, darwin, libtensorflow }:

let
  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "sticker";
    rev = "0.4.0";
    sha256 = "0x05bmnvpzfy3fzzs6rv44q7l08ga9lysf27q8waax5lcb1ksl5y";
  };
in ((callPackage ./sticker.nix {}).sticker_utils {}).override {
  crateOverrides = defaultCrateOverrides // {
    sticker = attr: { inherit src; };

    sticker-utils = attrs: {
      inherit src;

      buildInputs = stdenv.lib.optional stdenv.isDarwin darwin.Security;

      meta = with stdenv.lib; {
        description = "Neural sequence labeler";
        license = licenses.asl20;
        platforms = platforms.all;
      };
    };

    tf-proto = attrs: { inherit src; };

    tensorflow-sys = attrs: {
      nativeBuildInputs = [ pkgconfig ];

      buildInputs = [ libtensorflow ] ++
        stdenv.lib.optional stdenv.isDarwin curl;
    };
  };
}
