{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, darwin, pkgconfig, libtensorflow, openssl }:

let
  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "sticker";
    rev = "0.3.0";
    sha256 = "1ji6fcm8gd5j8p65daj7qh0vasgdaag2qra6gl9rd813czjws9mk";
  };
in ((callPackage ./sticker.nix {}).sticker_utils {}).override {
  crateOverrides = defaultCrateOverrides // {
    sticker = attr: { src = src; };

    sticker-utils = attrs: {
      src = src;

      meta = with stdenv.lib; {
        description = "Neural sequence labeler";
        license = licenses.asl20;
        platforms = platforms.all;
      };
    };

    tf-proto = attrs: { src = src; };

    tensorflow-sys = attrs: {
      nativeBuildInputs = [ pkgconfig ];

      buildInputs = [ libtensorflow ];
    };
  };
}
