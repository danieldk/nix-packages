{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, pkgconfig,
  curl, darwin, libtensorflow }:

let
  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "sticker";
    rev = "0.6.1";
    sha256 = "02s2nh1vvr8cdpr8a9v6203nwjjylcywa23q0zn52lqr5la3vgzl";
  };
in ((callPackage ./sticker.nix {}).sticker_utils {}).override {
  crateOverrides = defaultCrateOverrides // {
    sticker = attr: { inherit src; };

    sticker-utils = attrs: {
      inherit src;

      buildInputs = stdenv.lib.optional stdenv.isDarwin darwin.Security;

      postInstall = ''
        # We do not care for sticker-utils as a library crate. Removing
        # the library reduces the number of dependencies.
        rm -rf $out/lib
      '';

      meta = with stdenv.lib; {
        description = "Neural sequence labeler";
        license = licenses.asl20;
        platforms = platforms.all;
      };
    };

    sticker-tf-proto = attrs: { inherit src; };

    tensorflow-sys = attrs: {
      nativeBuildInputs = [ pkgconfig ];

      buildInputs = [ libtensorflow ] ++
        stdenv.lib.optional stdenv.isDarwin curl;
    };
  };
}
