{ pkgs
, stdenv
, callPackage
, fetchgit

  # Native build inputs
, maturin

  # Build inputs
, python
}:

let
  rustPlatform = callPackage ./rust-platform-nightly.nix {};
in (rustPlatform "2019-07-30").buildRustPackage rec {
  pname = "alpino-tokenizer";
  version = "0.1.0";
  name = "${python.libPrefix}-${pname}-${version}";

  src = fetchgit {
    url = "https://git.sr.ht/~danieldk/alpino-tokenizer-python";
    rev = version;
    sha256 = "0ank3801xab78b0180012li8i38vcjfhdi3mvmx49gxp5b23lscc";
  };

  cargoSha256 = "1ykcw8497pxlqd65apjmg2ck38d0grf6z1ywyb1q30q9an7siyg5";

  nativeBuildInputs = [ maturin ];

  buildInputs = [ python ];

  doCheck = false;

    buildPhase = ''
    runHook preBuild

    maturin build --release --manylinux off

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    ${python.pythonForBuild.pkgs.bootstrapped-pip}/bin/pip install \
      target/wheels/*.whl --no-index --prefix=$out --no-cache --build tmpbuild

    runHook postInstall
  '';

  meta = with stdenv.lib; {
    description = "Python module wrapping the Alpino tokenizer for Dutch";
    license = licenses.lgpl21Plus;
    maintainers = with maintainers; [ danieldk ];
    platforms = platforms.unix;
  };

}
