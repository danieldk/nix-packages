{ stdenv, fetchurl, autoPatchelfHook, makeWrapper, tcl-8_5, tk-8_5 }:

stdenv.mkDerivation rec {
  pname = "fsa6";
  version = "280";

  src = fetchurl {
    url = "https://www.let.rug.nl/~vannoord/Fsa/binaries/${pname}-${version}-x86_64-linux-glibc2.19.tar.gz";
    sha256 = "1b140b9d31bc1a504893ad17b59893e89e2140ea943e7642e9b4efe616f46093";
  };

  nativeBuildInputs = [ autoPatchelfHook makeWrapper ];

  buildInputs = [ tcl-8_5 tk-8_5 ];

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/fsa6
    cp -a * $out/share/fsa6

    mkdir $out/bin
    makeWrapper $out/share/fsa6/binary/create/fsa $out/bin/fsa6 --prefix TCLLIBPATH ' ' "${tk-8_5}/lib"
  '';

  meta = with stdenv.lib; {
    description = "Finite state automata utilities";
    license = licenses.gpl2;
    maintainers = with maintainers; [ danieldk ];
    platforms = platforms.linux;
  };
}
