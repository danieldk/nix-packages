{ stdenv
, callPackage
, fetchFromGitHub

  # Native build inputs
, maturin
, pipInstallHook
, rustPlatform

  # Build inputs
, python
}:

rustPlatform.buildRustPackage rec {
  pname = "alpino-tokenizer";
  version = "0.1.1";
  name = "${python.libPrefix}-${pname}-${version}";

  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "alpino-tokenizer-python";
    rev = version;
    sha256 = "0ly9xsfrv094qqw3n6kjwzhqh382y2gwms5qw0gc9x0b19jjxgz6";
  };

  cargoSha256 = "sha256-D4P96sFS71om02ajry2LS8sqyMmYQ6mfpV+yJn9rfOE=";

  nativeBuildInputs = [ maturin pipInstallHook ];

  propagatedBuildInputs = [ python ];

  doCheck = false;

  buildPhase = ''
    maturin build --release --manylinux off
  '';

  installPhase = ''
    # Put the wheels where the pip install hook can find them.
    install -Dm644 -t dist target/wheels/*.whl
    pipInstallPhase
  '';

  meta = with stdenv.lib; {
    description = "Python module wrapping the Alpino tokenizer for Dutch";
    license = licenses.lgpl21Plus;
    maintainers = with maintainers; [ danieldk ];
    platforms = platforms.unix;
  };

}
