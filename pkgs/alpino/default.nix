{ stdenv
, fetchurl
, autoPatchelfHook
, makeDesktopItem
, makeWrapper
, boost159
, glibc
, gnugrep
, libXScrnSaver
, tcl-8_6
, tk-8_6 }:

let
  boost158 = boost159.overrideAttrs (oldAttrs: rec {
    name = "boost-${version}";
    version = "1.58.0";

    src = fetchurl {
      url = "mirror://sourceforge/boost/boost_1_58_0.tar.bz2";
      sha256 = "1rfkqxns60171q62cppiyzj8pmsbwp1l8jd7p6crriryqd7j1z7x";
    };
  });
  desktopItem = makeDesktopItem {
    name = "Alpino";
    exec = "alpino";
    comment = "Alpino dependency parser for Dutch";
    desktopName = "Alpino";
    icon = "alpino";
    categories = "Science;";
    terminal = "true";
  };
in stdenv.mkDerivation rec {
  pname = "alpino";
  version = "308";

  src = fetchurl {
    url = "http://www.let.rug.nl/vannoord/alp/Alpino/versions/binary/Alpino-x86_64-Linux-glibc-2.23-git${version}-sicstus.tar.gz";
    hash = "sha256-XASerKEy1q/LbZV4fv891QC6cwNEW8oVTu/06ozIT+w=";
  };

  nativeBuildInputs = [ autoPatchelfHook makeWrapper ];

  buildInputs = [
    boost158
    libXScrnSaver
    stdenv.cc.cc.lib
    tcl-8_6
    tk-8_6
  ];

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    # Use system-wide TCL/TK.
    rm -rf create_bin/extralibs

    mkdir -p $out/share/alpino
    cp -a * $out/share/alpino

    mkdir $out/bin
    makeWrapper $out/share/alpino/bin/Alpino $out/bin/alpino \
      --prefix PATH : ${stdenv.lib.makeBinPath [ glibc gnugrep ]}

    install -Dm644 -t $out/share/applications \
      ${desktopItem}/share/applications/Alpino.desktop
    install -Dm644 ${./alpino.png} $out/share/icons/alpino.png
  '';

  meta = with stdenv.lib; {
    description = "Alpino dependency parser for Dutch";
    license = licenses.lgpl21Plus;
    maintainers = with maintainers; [ danieldk ];
    platforms = [ "x86_64-linux" ];
    hydraPlatforms = [];
  };
}
