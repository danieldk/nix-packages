{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, darwin, pkgconfig, libtensorflow, openssl }:

let
  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "sticker";
    rev = "0.2.2";
    sha256 = "0jn7fllix14fqgq46xnfi5yx0i6b0abwdcv827qzdg5bjnlzjfg3";
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
