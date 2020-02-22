{ stdenv
, callPackage
, fetchgit

  # Native build inputs
, maturin

  # Build inputs
, python
}:

let
  rustPlatform = callPackage ./rust-platform-nightly.nix {};
in (rustPlatform "2020-01-20").buildRustPackage rec {
  pname = "alpino-tokenizer";
  version = "0.1.1";
  name = "${python.libPrefix}-${pname}-${version}";

  src = fetchgit {
    url = "https://git.sr.ht/~danieldk/alpino-tokenizer-python";
    rev = version;
    sha256 = "14f345wcqbkfrxxifs64b9686sn5g8sxlr7zsvncq2zqykcasspq";
  };

  cargoSha256 = "0fipz79wnly8mj76m5dl9rzyzzdadsnxdgd538pz4zphfw0hzscv";

  nativeBuildInputs = [ maturin python.pkgs.pip ];

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
